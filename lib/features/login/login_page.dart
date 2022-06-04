import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/home/home_page.dart';
import 'package:in_100_days/features/login/login.dart';

class LoginPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTwitterLoggedIn = ref.watch(isTwitterLoggedInProvider);

    isTwitterLoggedIn.when(
        data: (isTwitterLoggedIn) {
          if (isTwitterLoggedIn) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
        error: (error, st) => ErrorPage(error: error),
        loading: () => const Center(child: CircularProgressIndicator()));
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('Sign in with Twitter'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
