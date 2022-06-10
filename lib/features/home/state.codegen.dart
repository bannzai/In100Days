import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/goal.dart';
import 'package:in_100_days/provider/user.dart';

part 'state.codegen.freezed.dart';

final homeAsyncStateProvider =
    Provider.autoDispose<AsyncValue<HomeState>>((ref) {
  final user = ref.watch(userStreamProvider);
  final goals = ref.watch(goalsStreamProvider);

  if (user is AsyncLoading || goals is AsyncLoading) {
    return const AsyncValue.loading();
  }

  final userValue = user.value;
  final goalsValue = goals.value;
  if (userValue == null || goalsValue == null) {
    return const AsyncValue.error(
        FormatException('unexpected user or goals is null for home state'));
  }

  try {
    return AsyncValue.data(HomeState(
      user: userValue,
      goals: goalsValue,
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
