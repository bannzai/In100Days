import 'package:dart_twitter_api/twitter_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:in_100_days/provider/secure_storage.dart';
import 'package:in_100_days/secret/secret.dart';

late TwitterApi twitterAPIClient;

Future<void> setupTwitterAPIClient() async {
  const secureStorage = FlutterSecureStorage();
  final twitterAuthToken =
      await secureStorage.read(key: SecuretStorageKeys.twitterAuthToken);
  final twitterAuthTokenSecret =
      await secureStorage.read(key: SecuretStorageKeys.twitterAuthTokenSecret);
  if (twitterAuthToken == null || twitterAuthTokenSecret == null) {
    return;
  }

  twitterAPIClient = TwitterApi(
    client: TwitterClient(
      consumerKey: Secret.twitterApiKey,
      consumerSecret: Secret.twitterApiKeySecret,
      token: twitterAuthToken,
      secret: twitterAuthTokenSecret,
    ),
  );
}
