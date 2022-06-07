import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/step.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/step.dart';
import 'package:in_100_days/provider/user.dart';

part 'state.codegen.freezed.dart';

final stepsAsyncStateProvider =
    Provider.family.autoDispose<AsyncValue<StepsState>, Goal>((ref, Goal goal) {
  final user = ref.watch(userStreamProvider);
  final steps = ref.watch(stepsStreamProvider(goal.id!));

  if (user is AsyncLoading || steps is AsyncLoading) {
    return const AsyncValue.loading();
  }

  try {
    return AsyncValue.data(
      StepsState(
        user: user.value!,
        steps: steps.value ?? [],
      ),
    );
  } catch (error, stackTrace) {
    return AsyncValue.error(error, stackTrace: stackTrace);
  }
});

@freezed
class StepsState with _$StepsState {
  factory StepsState({
    required User user,
    required List<Step> steps,
  }) = _StepsState;
  StepsState._();
}
