import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_100_days/style/color.dart';

class RecordAddSheetImageList extends StatelessWidget {
  const RecordAddSheetImageList({
    Key? key,
    required this.images,
  }) : super(key: key);

  final ValueNotifier<List<XFile>> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...images.value
                  .map((xFile) {
                    return [
                      const SizedBox(width: 14),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image(
                            image: FileImage(File(xFile.path)),
                            height: 130,
                            width: 180,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            right: -12,
                            top: -12,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  images.value = images.value
                                      .where((x) => x != xFile)
                                      .toList();
                                },
                                padding: EdgeInsets.zero,
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ];
                  })
                  .expand((x) => x)
                  .toList(),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "実際ツイートされる画像とは切り取られ方が違います\n必要があれば写真の加工をお願いします",
          style: TextStyle(
            color: AppColor.danger,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
