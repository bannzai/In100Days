import 'package:flutter/material.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/style/color.dart';
import 'package:in_100_days/utility/open_twitter_page.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.user,
    required this.fullHashTag,
  }) : super(key: key);

  final User user;
  final String fullHashTag;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: GestureDetector(
              child: CircleAvatar(
                radius: 44,
                backgroundImage: NetworkImage(user.orignalProfileImageURL),
                backgroundColor: Colors.black,
              ),
              onTap: () {
                openTwitterUser(user.twitterID);
              }),
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
        GestureDetector(
          child: Text(
            "@${user.twitterID}",
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.textMain),
          ),
          onTap: () {
            openTwitterUser(user.twitterID);
          },
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            openTwitterHashTag(fullHashTag);
          },
          child: Text(
            fullHashTag,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.twitterHashTag),
          ),
        ),
      ],
    );
  }
}
