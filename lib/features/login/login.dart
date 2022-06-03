import 'package:in_100_days/secret/secret.dart';
import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:riverpod/riverpod.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

final twitterLoginProvider = FutureProvider((ref) => twitterLogin());

Future<AuthResult> twitterLogin() {
  final twitterLogin = TwitterLogin(
    apiKey: TwitterAPISecret.apiKey,
    apiSecretKey: TwitterAPISecret.apiKeySecret,
    redirectURI: 'in100days://',
  );
  return twitterLogin.login();

//  final apiResponse = await client.get(
//    Uri.parse(
//        'https://api.twitter.com/1.1/statuses/home_timeline.json?count=1'),
//  );
//  print(apiResponse.body);
}
