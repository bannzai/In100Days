import 'package:dart_twitter_api/api/tweets/data/tweet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/features/record_add/image_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_100_days/provider/twitter_api_client.dart';
import 'package:in_100_days/style/button.dart';
import 'package:in_100_days/style/color.dart';
import 'package:in_100_days/utility/chunk.dart';
import 'package:in_100_days/utility/open_twitter_page.dart';
import 'package:mime_type/mime_type.dart';

// ignore: constant_identifier_names
const _1MB = 1024 * 1024;

class RecordAddSheet extends HookConsumerWidget {
  final String initialMessage;
  final User user;
  final Goal goal;
  final Future<void> Function(Tweet, String) onPost;

  const RecordAddSheet({
    Key? key,
    required this.initialMessage,
    required this.user,
    required this.goal,
    required this.onPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useState(initialMessage);
    final images = useState<List<XFile>>([]);

    const double profileImageRadius = 16;
    const double profileImageBorderWidth = 0.5;
    const double paddingBetweenProfileImageAndTextField = 10;
    const double paddingHorizontal = 23;
    final textFieldWidth = MediaQuery.of(context).size.width -
        paddingHorizontal * 2 -
        profileImageRadius * 2 -
        profileImageBorderWidth * 2 -
        paddingBetweenProfileImageAndTextField;

    const textFieldLineCount = 20;
    // TODO: Fill store link if record is empty after first release
    final textFieldController = useTextEditingController(text: initialMessage);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: paddingHorizontal,
        top: 60,
        right: paddingHorizontal,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              children: [
                AppTextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  text: const Text(
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
                AppTextButton(
                  onPressed: text.value.isEmpty
                      ? null
                      : () async {
                          if (text.value.isEmpty) {
                            return;
                          }

                          try {
                            final mediaIDs = await _mediaIDs(images.value);
                            final tweet =
                                await twitterAPIClient.tweetService.update(
                              status: text.value + "\n\n" + goal.fullHashTag,
                              mediaIds: mediaIDs,
                            );

                            await onPost(tweet, text.value);

                            Navigator.of(context).pop();
                          } catch (error) {
                            showErrorAlert(context, error: error);
                          }
                        },
                  text: const Text(
                    "投稿",
                    style: TextStyle(
                      color: AppColor.textMain,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                  width: textFieldWidth,
                  child: Stack(
                    children: [
                      TextField(
                        autofocus: true,
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        maxLength:
                            140 - (goal.fullHashTag.length + "\n\n".length),
                        minLines: 1,
                        maxLines: textFieldLineCount,
                        textInputAction: TextInputAction.newline,
                        controller: textFieldController,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColor.textMain),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: AppColor.textNote,
                          ),
                          counter: Column(
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                "${text.value.length + goal.fullHashTag.length + "\n\n".length}/140",
                                style: const TextStyle(
                                    color: AppColor.textNote,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        onChanged: (_text) {
                          text.value = _text;
                        },
                      ),
                      Positioned(
                        bottom: 16,
                        child: GestureDetector(
                          onTap: () {
                            openTwitterHashTag(goal.fullHashTag);
                          },
                          child: Text(
                            goal.fullHashTag,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: AppColor.twitterHashTag),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (images.value.isNotEmpty)
              RecordAddSheetImageList(images: images),
            const Spacer(),
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
          ],
        ),
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

void showRecordAddSheet(
  BuildContext context, {
  required String initialMessage,
  required User user,
  required Goal goal,
  required Future<void> Function(Tweet, String) onPost,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => RecordAddSheet(
      initialMessage: initialMessage,
      goal: goal,
      user: user,
      onPost: onPost,
    ),
  );
}
