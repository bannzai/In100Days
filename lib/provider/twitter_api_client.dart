import 'package:dart_twitter_api/twitter_api.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/secret/secret.dart';
import 'package:riverpod/riverpod.dart';

final twitterAPIClientProvider = Provider.family((ref, AuthInfo authInfo) {
  final twitterAPI = TwitterApi(
    client: TwitterClient(
      consumerKey: TwitterAPISecret.apiKey,
      consumerSecret: TwitterAPISecret.apiKeySecret,
      token: authInfo.twitterAuthToken,
      secret: authInfo.twitterAuthTokenSecret,
    ),
  );

  return twitterAPI;
});
