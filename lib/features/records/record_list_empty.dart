import 'package:flutter/material.dart';
import 'package:in_100_days/components/user_info.dart';
import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/features/record_add/record_add_sheet.dart';
import 'package:in_100_days/features/records/state.codegen.dart';
import 'package:in_100_days/provider/record.dart';
import 'package:in_100_days/style/color.dart';

class RecordListEmpty extends StatelessWidget {
  final RecordsState state;
  const RecordListEmpty({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          UserInfo(
            user: state.user,
            fullHashTag: state.goal.fullHashTag,
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text("初めての記録をしましょう",
                  style: TextStyle(fontSize: 20, color: AppColor.textMain)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => showRecordAddSheet(
                  context,
                  initialMessage:
                      """「#100日後に」アプリで ${state.goal.fullHashTag} を始めました！

#100日後に: https://in100days.page.link/welcome""",
                  goal: state.goal,
                  user: state.user,
                  onPost: (tweet, text, recordAddSheetContext) async {
                    final record = Record(
                      tweetID: tweet.idStr!,
                      message: text,
                      hashTag: state.goal.hashTag,
                      createdDateTime: DateTime.now(),
                    );

                    final createRecord = CreateRecord();
                    await createRecord.call(record,
                        userID: state.user.id!, goalID: state.goal.id!);
                    Navigator.of(recordAddSheetContext).pop();
                  },
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: AppColor.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
