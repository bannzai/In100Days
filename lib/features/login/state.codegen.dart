import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/user.dart';

part 'state.codegen.freezed.dart';

final loginAsyncStateProvider =
    Provider.autoDispose<LoginState>((ref) => LoginState(user: null));

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required User? user,
  }) = _LoginState;
  LoginState._();
}
