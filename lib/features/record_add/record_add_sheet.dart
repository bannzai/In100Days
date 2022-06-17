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
import 'package:in_100_days/style/color.dart';
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

    const double profileImageRadius = 16;
    const double profileImageBorderWidth = 0.5;
    const double paddingBetweenProfileImageAndTextField = 10;
    const double paddingHorizontal = 23;
    final textFieldWidth = MediaQuery.of(context).size.width -
        paddingHorizontal * 2 -
        profileImageRadius * 2 -
        profileImageBorderWidth * 2 -
        paddingBetweenProfileImageAndTextField;
    final hashTag = "#100日後に${text.value}${user.twitterID}";

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: paddingHorizontal,
      ),
      child: Column(
        children: [
          Row(children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "キャンセル",
                style: TextStyle(
                  color: AppColor.textNote,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "投稿",
                style: TextStyle(
                  color: AppColor.textMain,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CircleAvatar(
                  radius: profileImageRadius,
                  backgroundImage: NetworkImage(user.orignalProfileImageURL),
                  backgroundColor: Colors.black,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: profileImageBorderWidth,
                  ),
                ),
              ),
              const SizedBox(width: paddingBetweenProfileImageAndTextField),
              SizedBox(
                height: 200,
                width: textFieldWidth,
                child: TextField(
                  maxLength: 140,
                  minLines: 2,
                  maxLines: 6,
                  textInputAction: TextInputAction.done,
                  controller: textFieldController,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColor.textMain,
                  ),
                  textAlign: TextAlign.left,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 8),
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppColor.textNote,
                    ),
                  ),
                  onChanged: (_text) {
                    text.value = _text;
                  },
                  onEditingComplete: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
            ],
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

      final uploadFinalizeResult =
          await twitterAPIClient.mediaService.uploadFinalize(mediaId: mediaID);
      if (uploadFinalizeResult.processingInfo != null &&
          uploadFinalizeResult.processingInfo!.pending) {
        await _waitUploadCompletion(mediaId: mediaID);
      }

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
