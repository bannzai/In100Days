import 'package:flutter/material.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/style/button.dart';
import 'package:in_100_days/style/color.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterHashTag extends StatelessWidget {
  final Goal goal;

  const TwitterHashTag({Key? key, required this.goal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      text: Text(
        goal.fullHashTag,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: AppColor.twitterHashTag),
      ),
      onPressed: () async {
        launchUrl(Uri.parse(
            "https://twitter.com/search?q=#${goal.fullHashTag}&src=typed_query"));
      },
    );
  }
}
