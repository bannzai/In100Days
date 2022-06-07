import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/goal.dart';
import 'package:in_100_days/provider/record.dart';
import 'package:in_100_days/style/color.dart';

class RecordAddSheet extends HookConsumerWidget {
  final User user;
  final Goal goal;

  const RecordAddSheet({
    Key? key,
    required this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useState("");
    final textFieldController = useTextEditingController(text: "");

    const double paddingHorizontal = 20;
    final hashTag = "#100日後に${text.value}${user.screenName}";

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - paddingHorizontal * 2,
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
                final step = Step(stepAction: stepAction, fullHashTag: fullHashTag, createdDateTime: createdDateTime)
                await stepCollectionReference(
                  userID: FirebaseAuth.instance.currentUser!.uid,
                  goalID: goal.id!,
                ).doc().set(step, SetOptions(merge: true));
//                      await twitterAPIClient.tweetService.update(status: """
//#100日後に${text.value}$twitterIDName
//                        """);
                Navigator.of(context).pop();
              } catch (error) {
                showErrorAlert(context, error: error);
              }
            },
          ),
        ),
      ],
    );
  }
}
