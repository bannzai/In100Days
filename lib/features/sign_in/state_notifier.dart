import 'package:in_100_days/entity/user.codegen.dart';
import 'package:riverpod/riverpod.dart';

import 'async_action.dart';
import 'state.codegen.dart';

final loginStateNotifierProvider =
    StateNotifierProvider.autoDispose<SignInStateNotifier, SignInState>(
  (ref) => SignInStateNotifier(
    asyncAction: ref.watch(loginAsyncActionProvider),
    initialState: ref.watch(loginAsyncStateProvider),
  ),
);

class SignInStateNotifier extends StateNotifier<SignInState> {
  final SignInAsyncAction asyncAction;
  SignInStateNotifier({
    required this.asyncAction,
    required SignInState initialState,
  }) : super(initialState);

  void setUser(User user) {
    state = state.copyWith(user: user);
  }
}
