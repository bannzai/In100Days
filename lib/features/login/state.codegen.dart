import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/user.dart';

part 'state.codegen.freezed.dart';

final loginAsyncStateProvider =
    Provider.autoDispose<AsyncValue<LoginState>>((ref) {
  final user = ref.watch(userStreamProvider);

  if (user is AsyncLoading) {
    return const AsyncValue.loading();
  }

  try {
    return AsyncValue.data(LoginState(
      user: user.value,
    ));
  } catch (error, stackTrace) {
    return AsyncValue.error(error, stackTrace: stackTrace);
  }
});

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required User? user,
  }) = _LoginState;
  LoginState._();
}
