import 'package:flutter/material.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/style/color.dart';

class TwitterHashTag extends StatelessWidget {
  final Goal goal;

  const TwitterHashTag({Key? key, required this.goal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      goal.fullHashTag,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: AppColor.twitterHashTag),
    );
  }
}
