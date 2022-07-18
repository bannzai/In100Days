import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/goal.dart';

part 'state.codegen.freezed.dart';

final homeAsyncStateProvider =
    Provider.autoDispose.family<AsyncValue<HomeState>, User>((ref, user) {
  try {
    final goals = ref.watch(goalsStreamProvider);

    if (goals is AsyncLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(HomeState(
      user: user,
      goals: goals.value ?? [],
    ));
  } catch (error, stackTrace) {
    return AsyncValue.error(error, stackTrace: stackTrace);
  }
});

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required User user,
    required List<Goal> goals,
  }) = _HomeState;
  HomeState._();
}
