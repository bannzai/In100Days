import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/home/home_page.dart';
import 'package:in_100_days/features/login/login.dart';
import 'package:in_100_days/features/login/login_page.dart';

class Root extends HookConsumerWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTwitterLoggedIn = ref.watch(isTwitterLoggedInProvider);

    return isTwitterLoggedIn.when(
      data: (isTwitterLoggedIn) {
        if (isTwitterLoggedIn) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
      error: (error, st) => ErrorPage(error: error),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
