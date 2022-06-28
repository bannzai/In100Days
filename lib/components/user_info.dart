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
        Container(
          child: CircleAvatar(
            radius: 44,
            backgroundImage: NetworkImage(user.orignalProfileImageURL),
            backgroundColor: Colors.black,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
          ),
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
