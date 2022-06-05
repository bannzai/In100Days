import 'package:in_100_days/provider/secure_storage.dart';
import 'package:riverpod/riverpod.dart';

class AuthInfo {
  final String twitterAuthToken;
  final String twitterAuthTokenSecret;

  AuthInfo(
      {required this.twitterAuthToken, required this.twitterAuthTokenSecret});
}

final authInfoProvider = FutureProvider((ref) async {
  final storage = ref.watch(secureStorageProvider);

  final twitterAuthToken =
      await storage.read(key: SecuretStorageKeys.twitterAuthToken);
  final twitterAuthTokenSecret =
      await storage.read(key: SecuretStorageKeys.twitterAuthTokenSecret);
  if (twitterAuthToken == null || twitterAuthTokenSecret == null) {
    return null;
  }

  return AuthInfo(
      twitterAuthToken: twitterAuthToken,
      twitterAuthTokenSecret: twitterAuthTokenSecret);
});
