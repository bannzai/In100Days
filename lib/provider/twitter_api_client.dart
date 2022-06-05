import 'package:dart_twitter_api/twitter_api.dart';
import 'package:riverpod/riverpod.dart';

late TwitterApi twitterAPIClient;

final twitterAPIClientProvider = Provider((ref) {
  return twitterAPIClient;
});
