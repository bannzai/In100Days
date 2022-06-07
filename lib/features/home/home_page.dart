import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/goal/goal_input_sheet.dart';
import 'package:in_100_days/features/home/state_notifier.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/tweets.dart';

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
                builder: (context) {
                  return GoalInputSheet(twitterIDName: state.user.screenName);
                },
              );
            });
            return Container();
          } else {
            // TODO:
            return Container(child: Text("Tweet is not Empty"));
          }
        },
        error: (error, _) => ErrorPage(error: error),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
