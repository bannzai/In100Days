import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/provider/user.dart';
import 'package:in_100_days/style/color.dart';

import 'state_notifier.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier = ref.watch(loginStateNotifierProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 27),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "100日後",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textMain,
                      ),
                    ),
                    TextSpan(
                      text: "に達成したい目標・なりたい自分を決めましょう",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColor.textMain,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SvgPicture.asset("images/creater.svg"),
              const SizedBox(height: 10),
              SizedBox(
                height: 118,
                child: Column(children: const [
                  Text(
                    "Twitterのフォロワーにも経過報告をして応援をしてもらいましょう",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "※ 継続に失敗し再開する場合は課金が必要になります",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]),
              ),
              const Spacer(),
              ElevatedButton(
                child: const Text('Sign in with Twitter'),
                onPressed: () async {
                  try {
                    final user = await stateNotifier.asyncAction.signIn();

                    await ref
                        .read(userDocumentReferenceProvider(user.id!))
                        .set(user, SetOptions(merge: true));
                  } catch (error) {
                    showErrorAlert(context, error: error);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
