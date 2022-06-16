import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/record_add/record_add_sheet.dart';
import 'package:in_100_days/features/records/record_list.dart';
import 'package:in_100_days/features/records/record_list_empty.dart';
import 'package:in_100_days/features/records/state.codegen.dart';
import 'package:in_100_days/features/user/user_page.dart';

class RecordListPage extends HookConsumerWidget {
  final Goal goal;

  const RecordListPage({Key? key, required this.goal}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recordsAsyncStateProvider(goal));

    return state.when(
      data: (state) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) =>
                      RecordAddSheet(user: state.user, goal: state.goal),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.of(context).push(UserPageRoute.route());
              },
            ),
          ],
        ),
        body: SafeArea(
          child: _body(state),
        ),
      ),
      error: (error, _) => ErrorPage(error: error),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _body(RecordsState state) {
    if (state.records.isEmpty) {
      return RecordListEmpty(state: state);
    } else {
      return RecordList(state: state);
    }
  }
}
