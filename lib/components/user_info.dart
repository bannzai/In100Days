import 'package:flutter/material.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/style/color.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.user,
    required this.hashTag,
  }) : super(key: key);

  final User user;
  final String hashTag;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 62,
          backgroundImage: NetworkImage(user.orignalProfileImageURL),
          backgroundColor: Colors.black,
        ),
        const SizedBox(height: 10),
        Text(
          "@${user.twitterID}",
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.textMain),
        ),
        const SizedBox(height: 10),
        Text(
          hashTag,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.twitterHashTag),
        ),
      ],
    );
  }
}
