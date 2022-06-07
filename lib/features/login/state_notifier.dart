import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:riverpod/riverpod.dart';

import 'async_action.dart';
import 'state.codegen.dart';

final loginStateNotifierProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>(
  (ref) => LoginStateNotifier(
    asyncAction: ref.watch(loginAsyncActionProvider),
    initialState: ref.watch(loginAsyncStateProvider),
  ),
);

class LoginStateNotifier extends StateNotifier<LoginState> {
  final LoginAsyncAction asyncAction;
  LoginStateNotifier({
    required this.asyncAction,
    required LoginState initialState,
  }) : super(initialState);

  void setUser(User user) {
    state = state.copyWith(user: user);
  }
}
