import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/home/home.dart';
import 'package:in_100_days/features/sign_in/sign_in_page.dart';
import 'package:in_100_days/provider/user.dart';
import 'package:in_100_days/style/color.dart';

class Root extends HookConsumerWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStreamProvider);
    final userColor = ref.watch(userColorProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: userColor ?? AppColor.primary,
        inputDecorationTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.black),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.black,
        ),
      ),
      home: user.when(
        data: (user) {
          if (user != null) {
            return AppHome(user: user);
          } else {
            return const SignInPage();
          }
        },
        error: (error, st) => ErrorPage(error: error),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
