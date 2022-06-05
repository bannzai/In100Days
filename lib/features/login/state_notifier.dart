import 'state.codegen.dart';
import 'package:riverpod/riverpod.dart';

final loginStateNotifierProvider = StateNotifierProvider.autoDispose<
    LoginStateNotifier, AsyncValue<LoginState>>(
  (ref) => LoginStateNotifier(
    initialState: ref.watch(loginAsyncStateProvider),
  ),
);

class LoginStateNotifier extends StateNotifier<AsyncValue<LoginState>> {
  LoginStateNotifier({
    required AsyncValue<LoginState> initialState,
  }) : super(initialState);
}
