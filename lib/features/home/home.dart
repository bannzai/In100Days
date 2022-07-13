import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/goal/goal_input_sheet.dart';
import 'package:in_100_days/features/home/state_notifier.dart';
import 'package:in_100_days/features/purchase/purchase.dart';
import 'package:in_100_days/features/records/record_list_page.dart';

class AppHome extends HookConsumerWidget {
  final User user;
  const AppHome({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateNotifierProvider(user));
    useEffect(() {
      final userID = state.asData?.value.user.id;
      if (userID != null) {
        unawaited(FirebaseAnalytics.instance.setUserId(id: userID));
        unawaited(FirebaseCrashlytics.instance.setUserIdentifier(userID));
      }
      return null;
    }, [state.asData?.value.user.id]);
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
                  return GoalInputSheet(user: state.user);
                },
              );
            });
            return Container();
          } else {
            return RecordListPage(goal: state.goals.last);
          }
        },
        error: (error, _) => ErrorPage(
              error: error,
              reload: () => ref.refresh(homeStateNotifierProvider(user)),
            ),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
