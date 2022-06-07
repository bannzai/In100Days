import 'dart:async';

import 'state.codegen.dart';
import 'package:riverpod/riverpod.dart';

final homeStateNotifierProvider =
    StateNotifierProvider.autoDispose<HomeStateNotifier, AsyncValue<HomeState>>(
  (ref) => HomeStateNotifier(
    initialState: ref.watch(homeAsyncStateProvider),
  ),
);

class HomeStateNotifier extends StateNotifier<AsyncValue<HomeState>> {
  HomeStateNotifier({
    required AsyncValue<HomeState> initialState,
  }) : super(initialState);
}
