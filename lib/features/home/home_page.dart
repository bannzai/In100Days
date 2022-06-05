import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/provider/twitter_api_client.dart';
import 'package:in_100_days/secret/secret.dart';
import 'package:oauth1/oauth1.dart';

class HomePage extends HookConsumerWidget {
  final Client twitterAPIClient;
  const HomePage({Key? key, required this.twitterAPIClient}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() async {
      final apiResponse = await twitterAPIClient.get(
        Uri.parse(
            'https://api.twitter.com/1.1/statuses/home_timeline.json?count=1'),
      );

      print(apiResponse.body);
    });
    return Scaffold(
        body: Column(children: [
      Text("hello, world"),
    ]));
  }
}
