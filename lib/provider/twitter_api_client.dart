import 'package:in_100_days/provider/secure_storage.dart';
import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:riverpod/riverpod.dart';

import '../oauth/oatuh1.dart';

final twitterAPIClientProvider = Provider((ref) async {
  final secureStorage = ref.watch(secureStorageProvider);
  final twitterAuthToken =
      await secureStorage.read(key: SecuretStorageKeys.twitterAuthToken);
  final twitterAuthTokenSecret =
      await secureStorage.read(key: SecuretStorageKeys.twitterAuthTokenSecret);

  final client = oauth1.Client(
    oAuth1TwitterPlatform.signatureMethod,
    clientCredentials,
    oauth1.Credentials(twitterAuthToken!, twitterAuthTokenSecret!),
  );
  return client;
});
