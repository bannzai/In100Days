import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/provider/record.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_100_days/provider/twitter_api_client.dart';
import 'package:in_100_days/utility/chunk.dart';
import 'package:mime_type/mime_type.dart';

// ignore: constant_identifier_names
const _1MB = 1024 * 1024;

class RecordAddSheet extends HookConsumerWidget {
  final User user;
  final Goal goal;

  const RecordAddSheet({
    Key? key,
    required this.user,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useState("");
    final images = useState<List<XFile>>([]);
    final textFieldController = useTextEditingController(text: "");

    const double paddingHorizontal = 20;
    final hashTag = "#100日後に${text.value}${user.twitterID}";

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: paddingHorizontal,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width - paddingHorizontal * 2,
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: textFieldController,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 44,
              ),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.only(bottom: 8),
              ),
              onChanged: (_text) {
                text.value = _text;
              },
              onEditingComplete: () async {
                FocusManager.instance.primaryFocus?.unfocus();

                if (text.value.isEmpty) {
                  return;
                }

                final record = Record(
                  message: text.value,
                  hashTag: hashTag,
                  createdDateTime: DateTime.now(),
                );
                try {
                  final mediaIDs = await _mediaIDs(images.value);
                  await twitterAPIClient.tweetService.update(
                    status: """
${text.value}
$hashTag""",
                    mediaIds: mediaIDs,
                  );

                  await recordCollectionReference(
                    userID:
                        firebase_auth.FirebaseAuth.instance.currentUser!.uid,
                    goalID: goal.id!,
                  ).doc().set(record, SetOptions(merge: true));

                  Navigator.of(context).pop();
                } catch (error) {
                  showErrorAlert(context, error: error);
                }
              },
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.photo),
                onPressed: () async {
                  try {
                    final picker = ImagePicker();
                    images.value = await picker.pickMultiImage() ?? [];
                  } catch (error) {
                    showErrorAlert(context,
                        error: "写真を選択できませんでした。アプリの設定から写真のアクセスの許可をしてください");
                  }
                },
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  // Upload media https://developer.twitter.com/en/docs/twitter-api/v1/media/upload-media/overview
  Future<List<String>> _mediaIDs(List<XFile> images) async {
    var mediaIDs = <String>[];
    for (final image in images) {
      final bytes = await image.readAsBytes();
      final totalBytes = bytes.length;
      final mediaType = mime(image.path);
      if (totalBytes <= 0 || mediaType == null) {
        throw const FormatException("Invalid image");
      }

      final uploadInit = await twitterAPIClient.mediaService
          .uploadInit(totalBytes: totalBytes, mediaType: mediaType);
      final mediaID = uploadInit.mediaIdString!;

      var segmentIndex = 0;
      final mediaChunks = chunk(bytes, size: _1MB);
      for (final mediaChunk in mediaChunks) {
        await twitterAPIClient.mediaService.uploadAppend(
          mediaId: mediaID,
          media: mediaChunk,
          segmentIndex: segmentIndex,
        );

        segmentIndex = segmentIndex + 1;
      }

      await twitterAPIClient.mediaService.uploadFinalize(mediaId: mediaID);
      await _waitUploadCompletion(mediaId: mediaID);

      mediaIDs.add(mediaID);
    }

    return mediaIDs;
  }

  Future<void> _waitUploadCompletion({
    required String mediaId,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final uploadStatus = await twitterAPIClient.mediaService.uploadStatus(
      mediaId: mediaId,
    );
    final processingInfo = uploadStatus.processingInfo;
    if (processingInfo == null) {
      throw const FormatException("ProcessInfo is missed");
    }

    if (processingInfo.inProgress) {
      return await _waitUploadCompletion(mediaId: mediaId);
    }
    if (processingInfo.succeeded) {
      return;
    }

    throw const FormatException("Upload failed");
  }
}
