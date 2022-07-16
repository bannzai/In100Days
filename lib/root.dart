import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/home/home.dart';
import 'package:in_100_days/features/sign_in/sign_in_page.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/user.dart';

class Root extends HookConsumerWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStreamProvider);

    return user.when(
      data: (user) {
        if (user != null) {
          return AppHome(user: user);
        } else {
          return const SignInPage();
        }
      },
      error: (error, st) => ErrorPage(
        error: error,
        reload: () => ref.refresh(firebaseCurrentUserProvider),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
