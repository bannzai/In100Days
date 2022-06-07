import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/user.dart';

import 'state_notifier.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier = ref.watch(loginStateNotifierProvider.notifier);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Sign in with Twitter'),
              onPressed: () async {
                try {
                  final user = await stateNotifier.asyncAction.signIn();

                  await ref
                      .read(userDocumentReferenceProvider(user.id!))
                      .set(user, SetOptions(merge: true));

                  ref.refresh(authInfoProvider);
                } catch (error) {
                  showErrorAlert(context, error: error);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
