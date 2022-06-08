import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/record.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/record.dart';
import 'package:in_100_days/provider/user.dart';

part 'state.codegen.freezed.dart';

final recordsAsyncStateProvider = Provider.family
    .autoDispose<AsyncValue<RecordsState>, Goal>((ref, Goal goal) {
  final user = ref.watch(userStreamProvider);
  final records = ref.watch(recordsStreamProvider(goal.id!));

  if (user is AsyncLoading || records is AsyncLoading) {
    return const AsyncValue.loading();
  }

  try {
    return AsyncValue.data(
      RecordsState(
        user: user.value!,
        goal: goal,
        records: records.value ?? [],
      ),
    );
  } catch (error, stackTrace) {
    return AsyncValue.error(error, stackTrace: stackTrace);
  }
});

@freezed
class RecordsState with _$RecordsState {
  factory RecordsState({
    required User user,
    required Goal goal,
    required List<Record> records,
  }) = _RecordsState;
  RecordsState._();
}
