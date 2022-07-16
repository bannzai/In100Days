import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/record_add/record_add_sheet.dart';
import 'package:in_100_days/features/records/record_list.dart';
import 'package:in_100_days/features/records/record_list_empty.dart';
import 'package:in_100_days/features/records/state.codegen.dart';
import 'package:in_100_days/features/setting/setting_page.dart';
import 'package:in_100_days/provider/record.dart';
import 'package:in_100_days/style/color.dart';

import 'utility.dart';

class RecordListPage extends HookConsumerWidget {
  final Goal goal;

  const RecordListPage({Key? key, required this.goal}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recordsAsyncStateProvider(goal));

    return state.when(
      data: (state) {
        final gameOverAndNotYetPurchase =
            isGameOver(state.records) && !purchasedInToday(goal);
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                _content(state),
                Positioned(
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Navigator.of(context).push(UserPageRoute.route());
                    },
                  ),
                )
              ],
            ),
          ),
          floatingActionButton:
              gameOverAndNotYetPurchase || state.records.isEmpty
                  ? null
                  : ElevatedButton(
                      onPressed: () => showRecordAddSheet(
                        context,
                        initialMessage: "",
                        goal: state.goal,
                        user: state.user,
                        onPost: (tweet, text) async {
                          final record = Record(
                            tweetID: tweet.idStr!,
                            message: text,
                            hashTag: state.goal.fullHashTag,
                            createdDateTime: DateTime.now(),
                          );

                          final createRecord = CreateRecord();
                          await createRecord.call(record,
                              userID: state.user.id!, goalID: state.goal.id!);
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: AppColor.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
        );
      },
      error: (error, _) => ErrorPage(
        error: error,
        reload: () => ref.refresh(recordsAsyncStateProvider(goal)),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _content(RecordsState state) {
    if (state.records.isEmpty) {
      return RecordListEmpty(state: state);
    } else {
      return RecordList(state: state);
    }
  }
}
