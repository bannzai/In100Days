import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/provider/goal.dart';
import 'package:in_100_days/style/color.dart';

class GoalInputSheet extends HookConsumerWidget {
  final String twitterIDName;

  const GoalInputSheet({Key? key, required this.twitterIDName})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useState("");
    final textFieldController = useTextEditingController(text: "");

    const double paddingHorizontal = 20;
    final hashTag = "#100日後に${text.value}$twitterIDName";

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: paddingHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                children: const [
                  Text(
                    "#100日後に",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 44,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width:
                    MediaQuery.of(context).size.width - paddingHorizontal * 2,
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
                    try {
                      final goal = Goal(
                          goalAction: text.value,
                          fullHashTag: hashTag,
                          createdDateTime: DateTime.now());
                      await goalCollectionReference(
                              userID: FirebaseAuth.instance.currentUser!.uid)
                          .doc()
                          .set(goal, SetOptions(merge: true));
                      Navigator.of(context).pop();
                    } catch (error) {
                      showErrorAlert(context, error: error);
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    twitterIDName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 44,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                hashTag,
                style: const TextStyle(
                  color: AppColor.twitterHashTag,
                ),
              ),
              const SizedBox(height: 44),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
