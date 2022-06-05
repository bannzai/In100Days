import 'package:dart_twitter_api/twitter_api.dart';
import 'package:riverpod/riverpod.dart';

final tweetsProvider = Provider.family((ref, TwitterApi client) async {
  final userName = "";
  client.tweetSearchService.searchTweets(q: Uri.encodeQueryComponent("#"))
  return ref.read(authInfoProvider).when(
        data: (authInfo) {
          if (authInfo != null) {
            return authInfo.twitterAuthToken;
          } else {
            return null;
          }
        },
        error: (error, st) => null,
        loading: () => null,
      );
});
