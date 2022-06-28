import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/record_add/record_add_sheet.dart';
import 'package:in_100_days/features/records/record_list.dart';
import 'package:in_100_days/features/records/record_list_empty.dart';
import 'package:in_100_days/features/records/state.codegen.dart';

class RecordListPage extends HookConsumerWidget {
  final Goal goal;

  const RecordListPage({Key? key, required this.goal}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recordsAsyncStateProvider(goal));

    return state.when(
      data: (state) => Scaffold(
        body: SafeArea(
          child: state.records.isEmpty
              ? RecordListEmpty(state: state)
              : RecordList(state: state),
        ),
        floatingActionButton: state.records.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => showRecordAddSheet(context,
                    goal: state.goal, user: state.user),
              ),
      ),
      error: (error, _) => ErrorPage(error: error),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
