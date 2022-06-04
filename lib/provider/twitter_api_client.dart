import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:in_100_days/features/login/login.dart';
import 'package:riverpod/riverpod.dart';

import '../oauth/oatuh1.dart';

final twitterAPIClientProvider = Provider((ref) {
  final twitterLoginAuthResult = ref.watch(twitterLoginAuthResultProvider)!;

  final client = oauth1.Client(
    oAuth1TwitterPlatform.signatureMethod,
    clientCredentials,
    oauth1.Credentials(
      twitterLoginAuthResult.authToken!,
      twitterLoginAuthResult.authTokenSecret!,
    ),
  );
  return client;
});
