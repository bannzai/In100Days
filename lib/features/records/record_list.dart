import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/records/record_list_empty.dart';
import 'package:in_100_days/features/records/state.codegen.dart';

class RecordList extends HookConsumerWidget {
  final Goal goal;

  const RecordList({Key? key, required this.goal}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recordsAsyncStateProvider(goal));

    return state.when(
        data: (state) {
          if (state.records.isEmpty) {
            return RecordListEmpty(state: state);
          } else {
            return _RecordListBody(state: state);
          }
        },
        error: (error, _) => ErrorPage(error: error),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

class _RecordListBody extends StatelessWidget {
  final RecordsState state;

  const _RecordListBody({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: state.records.map((record) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: [
              Image.network(state.user.profileImageURL),
              Column(
                children: [
                  Text(record.message),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
