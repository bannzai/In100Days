import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/records/record_list_empty.dart';
import 'package:in_100_days/features/records/state.codegen.dart';

class RecordsList extends HookConsumerWidget {
  final Goal goal;

  const RecordsList({Key? key, required this.goal}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recordsAsyncStateProvider(goal));

    return state.when(
        data: (state) {
          if (state.records.isEmpty) {
            return RecordListEmpty(user: state.user, goal: state.goal);
          } else {}
        },
        error: (error, _) => ErrorPage(error: error),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
