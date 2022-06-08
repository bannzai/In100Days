import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/goal/goal_input_sheet.dart';
import 'package:in_100_days/features/home/state_notifier.dart';
import 'package:in_100_days/features/records/record_list.dart';
import 'package:in_100_days/provider/auth.dart';

class HomePage extends HookConsumerWidget {
  final AuthInfo authInfo;
  const HomePage({Key? key, required this.authInfo}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateNotifierProvider);
    return state.when(
        data: (state) {
          if (state.goals.isEmpty) {
            Future.microtask(() {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: false,
                enableDrag: false,
                builder: (context) {
                  return GoalInputSheet(twitterIDName: state.user.screenName);
                },
              );
            });
            return Container();
          } else {
            return RecordsList(goal: state.goals.last);
          }
        },
        error: (error, _) => ErrorPage(error: error),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
