import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/secure_storage.dart';
import 'package:riverpod/riverpod.dart';
import 'package:in_100_days/secret/secret.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../provider/twitter_api_client.dart';

class SignInAsyncAction {
  final FlutterSecureStorage secureStorage;

  SignInAsyncAction({required this.secureStorage});

  Future<User> signIn() async {
    final authResult = await twitterSignIn();
    final authToken = authResult.authToken;
    final authTokenSecret = authResult.authTokenSecret;
    if (authToken == null || authTokenSecret == null) {
      throw const FormatException("authToken or authTokenSecret is null");
    }

    // Store twitter authorized token and secret before setupTwitterAPIClient
    await secureStorageWrite(
        authToken: authToken, authTokenSecret: authTokenSecret);

    // Side effect Instantiate twitter API Client for app
    await setupTwitterAPIClient();

    final firebaseUserCredential = await firebaseSignInWithTwitter(
        authToken: authToken, authTokenSecret: authTokenSecret);

    final twitterUID = firebaseUserCredential.user!.providerData.first.uid;
    final twitterAPIMe =
        await twitterAPIClient.userService.usersShow(userId: twitterUID);

    final twitterAPIProfileImageURL = twitterAPIMe.profileImageUrlHttps!;
    final user = User(
      id: firebaseUserCredential.user!.uid,
      twitterUserID: twitterAPIMe.idStr!,
      name: twitterAPIMe.name!,
      screenName: twitterAPIMe.screenName!,
      twitterAPIProfileImageURL: twitterAPIProfileImageURL,
      orignalProfileImageURL:
          twitterAPIProfileImageURL.replaceFirst("_normal", ""),
      createdDateTime: DateTime.now(),
    );

    return user;
  }

  Future<AuthResult> twitterSignIn() {
    final twitterSignIn = TwitterLogin(
      apiKey: TwitterAPISecret.apiKey,
      apiSecretKey: TwitterAPISecret.apiKeySecret,
      redirectURI: 'in100days://',
    );
    return twitterSignIn.login();
  }

  Future<void> secureStorageWrite(
      {required String authToken, required String authTokenSecret}) async {
    await secureStorage.write(
      key: SecuretStorageKeys.twitterAuthToken,
      value: authToken,
    );
    await secureStorage.write(
      key: SecuretStorageKeys.twitterAuthTokenSecret,
      value: authTokenSecret,
    );
  }

  Future<firebase_auth.UserCredential> firebaseSignInWithTwitter(
      {required String authToken, required String authTokenSecret}) {
    final twitterAuthCredential = firebase_auth.TwitterAuthProvider.credential(
      accessToken: authToken,
      secret: authTokenSecret,
    );
    return firebase_auth.FirebaseAuth.instance
        .signInWithCredential(twitterAuthCredential);
  }
}

final loginAsyncActionProvider = Provider(
  (ref) => SignInAsyncAction(
    secureStorage: ref.watch(secureStorageProvider),
  ),
);
