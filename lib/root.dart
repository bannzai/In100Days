import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/home/home.dart';
import 'package:in_100_days/features/login/login_page.dart';
import 'package:in_100_days/features/user_delete/user_delete_button.dart';
import 'package:in_100_days/provider/auth.dart';

class Root extends HookConsumerWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authInfo = ref.watch(authInfoProvider);

    return authInfo.when(
      data: (authInfo) {
        if (authInfo != null) {
          return AppHome(authInfo: authInfo);
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
