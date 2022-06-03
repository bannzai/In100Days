import 'package:in_100_days/secret/secret.dart';
import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

final _oAuth1TwitterPlatform = oauth1.Platform(
  'https://api.twitter.com/oauth/request_token',
  'https://api.twitter.com/oauth/authorize',
  'https://api.twitter.com/oauth/access_token',
  oauth1.SignatureMethods.hmacSha1,
);
final _clientCredentials = oauth1.ClientCredentials(
    TwitterAPISecret.apiKey, TwitterAPISecret.apiKeySecret);

Future<AuthResult> login() async {
  final twitterLogin = TwitterLogin(
    apiKey: TwitterAPISecret.apiKey,
    apiSecretKey: TwitterAPISecret.apiKeySecret,
    redirectURI: 'in100days://',
  );
  return twitterLogin.login();

  // 取得した Access Token を使ってAPIにリクエストできる
  final client = oauth1.Client(
    _oAuth1TwitterPlatform.signatureMethod,
    _clientCredentials,
    oauth1.Credentials(
      authResult.authToken!,
      authResult.authTokenSecret!,
    ),
  );
  final apiResponse = await client.get(
    Uri.parse(
        'https://api.twitter.com/1.1/statuses/home_timeline.json?count=1'),
  );
  print(apiResponse.body);
}
