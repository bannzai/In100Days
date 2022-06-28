import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:in_100_days/secret/secret.dart';

final oAuth1TwitterPlatform = oauth1.Platform(
  'https://api.twitter.com/oauth/request_token',
  'https://api.twitter.com/oauth/authorize',
  'https://api.twitter.com/oauth/access_token',
  oauth1.SignatureMethods.hmacSha1,
);
final clientCredentials = oauth1.ClientCredentials(
    TwitterAPISecret.apiKey, TwitterAPISecret.apiKeySecret);
