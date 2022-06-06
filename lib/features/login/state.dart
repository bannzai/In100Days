import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.codegen.freezed.dart';

final loginAsyncStateProvider =
    Provider.autoDispose<AsyncValue<LoginState>>((ref) {
  final user = ref.watch(userProvider);
  final premiumAndTrial = ref.watch(premiumAndTrialProvider);
  final sharedPreferencesAsyncValue = ref.watch(sharedPreferenceProvider);

  if (user is AsyncLoading ||
      premiumAndTrial is AsyncLoading ||
      sharedPreferencesAsyncValue is AsyncLoading) {
    return const AsyncValue.loading();
  }

  try {
    final sharedPreferences = sharedPreferencesAsyncValue.value!;

    return AsyncValue.data(LoginState(
      user: user,
      premiumAndTrial: premiumAndTrial,
    ));
  } catch (error, stackTrace) {
    return AsyncValue.error(error, stackTrace: stackTrace);
  }
});

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required User user,
    required PremiumAndTrial premiumAndTrial,
  }) = _LoginState;
  LoginState._();
}
