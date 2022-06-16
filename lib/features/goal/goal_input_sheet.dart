import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/provider/goal.dart';
import 'package:in_100_days/style/button.dart';
import 'package:in_100_days/style/color.dart';

class GoalInputSheet extends HookConsumerWidget {
  final User user;

  const GoalInputSheet({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useState("");
    final textFieldController = useTextEditingController(text: "");

    const double paddingHorizontal = 20;
    final hashTag = "#100日後に${text.value}${user.twitterID}";

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: paddingHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "100日後",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textMain,
                      ),
                    ),
                    TextSpan(
                      text: "に達成したい目標・なりたい自分を決めましょう",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColor.textMain,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
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
              ),
              const SizedBox(height: 40.5),
              Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "#100日後に",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: AppColor.textMain,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width -
                          paddingHorizontal * 2,
                    ),
                    child: TextField(
                      maxLength: 20,
                      textInputAction: TextInputAction.done,
                      controller: textFieldController,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: AppColor.textMain,
                      ),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 8),
                      ),
                      onChanged: (_text) {
                        text.value = _text;
                      },
                      onEditingComplete: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        user.twitterID,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: AppColor.textMain,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                onPressed: text.value.isEmpty
                    ? null
                    : () async {
                        if (text.value.isEmpty) {
                          return;
                        }
                        try {
                          final goal = Goal(
                              goalAction: text.value,
                              fullHashTag: hashTag,
                              createdDateTime: DateTime.now());
                          await goalCollectionReference(userID: user.id!)
                              .doc()
                              .set(goal, SetOptions(merge: true));
                          Navigator.of(context).pop();
                        } catch (error) {
                          showErrorAlert(context, error: error);
                        }
                      },
                text: "目標を設定する",
              )
            ],
          ),
        ),
      ),
    );
  }
}
