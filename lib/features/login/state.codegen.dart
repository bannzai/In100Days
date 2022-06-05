import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_100_days/features/login/login.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/secure_storage.dart';
import 'package:riverpod/riverpod.dart';

part 'state.codegen.freezed.dart';

final loginAsyncStateProvider =
    Provider.autoDispose<AsyncValue<LoginState>>((ref) {
  final authInfo = ref.watch(authInfoProvider);

  if (authInfo is AsyncLoading) {
    return const AsyncValue.loading();
  }

  try {
    return AsyncValue.data(LoginState(
      isTwitterLoggedIn: authInfo.value != null,
    ));
  } catch (error, stackTrace) {
    return AsyncValue.error(error, stackTrace: stackTrace);
  }
});

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required bool isTwitterLoggedIn,
  }) = _LoginState;
  LoginState._();
}
