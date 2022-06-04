import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
