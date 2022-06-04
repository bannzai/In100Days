import 'package:in_100_days/provider/secure_storage.dart';
import 'package:in_100_days/secret/secret.dart';
import 'package:riverpod/riverpod.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

final twitterLoginAuthResultProvider =
    StateProvider<AuthResult?>((ref) => null);

final isTwitterLoggedInProvider = FutureProvider((ref) async {
  final storage = ref.watch(secureStorageProvider);
  final twitterAuthToken =
      await storage.read(key: SecuretStorageKeys.twitterAuthToken);
  final twitterAuthTokenSecret =
      await storage.read(key: SecuretStorageKeys.twitterAuthTokenSecret);
  return twitterAuthToken != null && twitterAuthTokenSecret != null;
});

Future<AuthResult> twitterLogin() {
  final twitterLogin = TwitterLogin(
    apiKey: TwitterAPISecret.apiKey,
    apiSecretKey: TwitterAPISecret.apiKeySecret,
    redirectURI: 'in100days://',
  );
  return twitterLogin.login();
}
//  final apiResponse = await client.get(
//    Uri.parse(
//        'https://api.twitter.com/1.1/statuses/home_timeline.json?count=1'),
//  );
//  print(apiResponse.body);
