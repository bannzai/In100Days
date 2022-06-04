import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/login/login.dart';

class Root extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTwitterLoggedIn = ref.watch(isTwitterLoggedInProvider);
    isTwitterLoggedIn.when(
        data: (isTwitterLoggedIn) {
          if (isTwitterLoggedIn) {}
        },
        error: (error) {
          
        },
        loading: () => const Center(child: CircularProgressIndicator()));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ログイン後に表示されたPINを入力
            TextFormField(
              controller: controller,
            ),
            ElevatedButton(
              onPressed: () async {},
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
