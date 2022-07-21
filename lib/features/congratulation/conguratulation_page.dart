import 'package:flutter/material.dart';
import 'package:in_100_days/components/kirakira.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/features/record_add/record_add_sheet.dart';
import 'package:in_100_days/provider/record.dart';
import 'package:in_100_days/style/button.dart';
import 'package:in_100_days/style/color.dart';

class CongratulationPage extends StatelessWidget {
  final User user;
  final Goal goal;
  const CongratulationPage({Key? key, required this.user, required this.goal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "継",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textMain,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "続",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textMain,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "成",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textMain,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "功",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textMain,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Kirakira(message: "＼（^o^）／"),
              const SizedBox(height: 10),
              Image.asset("images/conguraturations.png"),
              const SizedBox(height: 10),
              const Text(
                "あなたは見事100日間ゴールに向かって\n努力を継続できました！",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: AppColor.textMain,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'お祝いのツイートをする',
                onPressed: () async {
                  showRecordAddSheet(
                    context,
                    initialMessage: "",
                    goal: goal,
                    user: user,
                    onPost: (tweet, text, recordAddSheetContext) async {
                      final record = Record(
                        tweetID: tweet.idStr!,
                        message: text,
                        hashTag: goal.hashTag,
                        createdDateTime: DateTime.now(),
                        isConguratulation: true,
                      );

                      final createRecord = CreateRecord();
                      await createRecord.call(record,
                          userID: user.id!, goalID: goal.id!);

                      Navigator.of(recordAddSheetContext).pop();
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              GreyButton(
                  text: "閉じる", onPressed: () => Navigator.of(context).pop()),
            ],
          ),
        ),
      ),
    );
  }
}

extension CongratulationPageRoute on CongratulationPage {
  static Route<dynamic> route({required Goal goal, required User user}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "CongratulationPage"),
      builder: (_) => CongratulationPage(goal: goal, user: user),
      fullscreenDialog: true,
    );
  }
}
