import 'dart:async';

import 'package:in_100_days/provider/twitter_api_client.dart';
import 'package:in_100_days/secret/secret.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dart_twitter_api/twitter_api.dart' as twitter_api;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'async_action.dart';
import 'state.codegen.dart';

final loginStateNotifierProvider =
    StateNotifierProvider<LoginStateNotifier, AsyncValue<LoginState>>(
  (ref) => LoginStateNotifier(
    asyncAction: ref.watch(loginAsyncActionProvider),
    initialState: ref.watch(loginAsyncStateProvider),
  ),
);

class LoginStateNotifier extends StateNotifier<AsyncValue<LoginState>> {
  final LoginAsyncAction asyncAction;
  LoginStateNotifier({
    required this.asyncAction,
    required AsyncValue<LoginState> initialState,
  }) : super(initialState);
}
