import 'dart:async';

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

final firebaseAuthUserSetup = FutureProvider((ref) async {
  final waitForFirebaseAuthSetup = Future<User?>(() {
    final completer = Completer<User?>();

    StreamSubscription<User?>? subscription;
    subscription = FirebaseAuth.instance.userChanges().listen((firebaseUser) {
      completer.complete(firebaseUser);
      subscription?.cancel();
    });
    return completer.future;
  });

  return await waitForFirebaseAuthSetup;
});

final authInfoProvider = FutureProvider<AuthInfo?>((ref) async {
  final storage = ref.watch(secureStorageProvider);

  final twitterAuthToken =
      await storage.read(key: SecuretStorageKeys.twitterAuthToken);
  final twitterAuthTokenSecret =
      await storage.read(key: SecuretStorageKeys.twitterAuthTokenSecret);
  final firebaseAuthUserAsyncValue = ref.watch(firebaseAuthUserSetup);
  if (twitterAuthToken == null ||
      twitterAuthTokenSecret == null ||
      firebaseAuthUserAsyncValue is AsyncLoading) {
    return null;
  }

  final firebaseAuthUser = firebaseAuthUserAsyncValue.asData?.value;
  if (firebaseAuthUser == null) {
    throw const FormatException("User is not found");
  }

  return AuthInfo(
    twitterAuthToken: twitterAuthToken,
    twitterAuthTokenSecret: twitterAuthTokenSecret,
    firebaseUserID: firebaseAuthUser.uid,
  );
});
