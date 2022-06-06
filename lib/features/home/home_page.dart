import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/tweets.dart';

class HomePage extends HookConsumerWidget {
  final AuthInfo authInfo;
  const HomePage({Key? key, required this.authInfo}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tweetsStream = ref.watch(tweetsStreamProvider);

    return tweetsStream.when(
        data: (tweets) {
          if (tweets.isEmpty) {
            // TODO:
            return Container(child: Text("Tweet is Empty"));
          } else {
            // TODO:
            return Container(child: Text("Tweet is not Empty"));
          }
        },
        error: (error, _) => ErrorPage(error: error),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
