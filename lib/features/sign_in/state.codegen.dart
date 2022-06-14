import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/user.codegen.dart';

part 'state.codegen.freezed.dart';

final loginAsyncStateProvider =
    Provider.autoDispose<SignInState>((ref) => SignInState(user: null));

@freezed
class SignInState with _$SignInState {
  factory SignInState({
    required User? user,
  }) = _SignInState;
  SignInState._();
}
