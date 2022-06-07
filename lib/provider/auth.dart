import 'package:firebase_auth/firebase_auth.dart';
import 'package:in_100_days/provider/secure_storage.dart';
import 'package:riverpod/riverpod.dart';

class AuthInfo {
  final String firebaseUserID;
  final String twitterAuthToken;
  final String twitterAuthTokenSecret;

  AuthInfo({
    required this.firebaseUserID,
    required this.twitterAuthToken,
    required this.twitterAuthTokenSecret,
  });
}

final firebaseAuthUserChangesStream =
    StreamProvider((ref) => FirebaseAuth.instance.userChanges());

final authInfoProvider = FutureProvider<AuthInfo?>((ref) async {
  final storage = ref.watch(secureStorageProvider);

  final twitterAuthToken =
      await storage.read(key: SecuretStorageKeys.twitterAuthToken);
  final twitterAuthTokenSecret =
      await storage.read(key: SecuretStorageKeys.twitterAuthTokenSecret);
  final firebaseAuthUserStream = ref.watch(firebaseAuthUserChangesStream);
  if (twitterAuthToken == null ||
      twitterAuthTokenSecret == null ||
      firebaseAuthUserStream is AsyncLoading) {
    return null;
  }

  final firebaseAuthUser = firebaseAuthUserStream.value;
  if (firebaseAuthUser == null) {
    throw const FormatException("User is not found");
  }

  return AuthInfo(
    twitterAuthToken: twitterAuthToken,
    twitterAuthTokenSecret: twitterAuthTokenSecret,
    firebaseUserID: firebaseAuthUser.uid,
  );
});
