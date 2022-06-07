import 'dart:async';

import 'package:in_100_days/entity/goal.codegen.dart';

import 'state.codegen.dart';
import 'package:riverpod/riverpod.dart';

import 'state.codegen.dart';

final stepsStateNotifierProvider = StateNotifierProvider.autoDispose
    .family<StepsStateNotifier, AsyncValue<StepsState>, Goal>(
  (ref, Goal goal) => StepsStateNotifier(
    initialState: ref.watch(stepsAsyncStateProvider(goal)),
  ),
);

class StepsStateNotifier extends StateNotifier<AsyncValue<StepsState>> {
  StepsStateNotifier({
    required AsyncValue<StepsState> initialState,
  }) : super(initialState);
}
