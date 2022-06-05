import 'package:in_100_days/provider/auth.dart';
import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:riverpod/riverpod.dart';

import '../oauth/oatuh1.dart';

final twitterAPIClientProvider = Provider.family((ref, AuthInfo authInfo) {
  final client = oauth1.Client(
    oAuth1TwitterPlatform.signatureMethod,
    clientCredentials,
    oauth1.Credentials(
        authInfo.twitterAuthToken, authInfo.twitterAuthTokenSecret),
  );
  return client;
});
