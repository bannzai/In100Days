import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/twitter_api_client.dart';

class HomePage extends HookConsumerWidget {
  final AuthInfo authInfo;
  const HomePage({Key? key, required this.authInfo}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final twitterAPIClient = ref.watch(twitterAPIClientProvider(authInfo));

    Future.microtask(() async {
      final apiResponse = await twitterAPIClient.get(
        Uri.parse(
            'https://api.twitter.com/1.1/statuses/home_timeline.json?count=1'),
      );

      print(apiResponse.body);
    });
    return Scaffold(
        body: Column(children: [
      const Text("hello, world"),
    ]));
  }
}
