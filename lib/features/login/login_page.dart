import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/provider/user.dart';
import 'package:in_100_days/style/color.dart';

import 'state_notifier.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginStateNotifierProvider);
    final stateNotifier = ref.watch(loginStateNotifierProvider.notifier);

    print("[DEBUG] state: $state");
    Future.microtask(() {
      final user = state.user;
      print("[DEBUG] in microtask user: $user");
      if (user != null) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return ObjectiveSheet(twitterIDName: user.screenName);
          },
        );
      }
    });
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

                  stateNotifier.setUser(user);
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

class ObjectiveSheet extends HookConsumerWidget {
  final String twitterIDName;

  const ObjectiveSheet({Key? key, required this.twitterIDName})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = useState("");
    final textFieldController = useTextEditingController(text: "");

    const double paddingHorizontal = 20;

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: paddingHorizontal),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                children: const [
                  Text(
                    "#100日後に",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 44,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width:
                    MediaQuery.of(context).size.width - paddingHorizontal * 2,
                child: TextField(
                  controller: textFieldController,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 44,
                  ),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    filled: true,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 8),
                  ),
                  onChanged: (_text) {
                    text.value = _text;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    twitterIDName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 44,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text("#100日後に${text.value}$twitterIDName",
                  style: const TextStyle(
                    color: AppColor.twitterHashTag,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
