import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/secure_storage.dart';
import 'package:riverpod/riverpod.dart';
import 'package:in_100_days/secret/secret.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:dart_twitter_api/twitter_api.dart' as twitter_api;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../provider/twitter_api_client.dart';

class LoginAsyncAction {
  final FlutterSecureStorage secureStorage;

  LoginAsyncAction({required this.secureStorage});

  Future<User> signIn() async {
    final authResult = await twitterLogin();
    final authToken = authResult.authToken;
    final authTokenSecret = authResult.authTokenSecret;
    if (authToken == null || authTokenSecret == null) {
      throw const FormatException("authToken or authTokenSecret is null");
    }

    await secureStorageWrite(
        authToken: authToken, authTokenSecret: authTokenSecret);

    // Side effect Instantiate twitter API Client for app
    twitterAPIClient = twitter_api.TwitterApi(
      client: twitter_api.TwitterClient(
        consumerKey: TwitterAPISecret.apiKey,
        consumerSecret: TwitterAPISecret.apiKeySecret,
        token: authToken,
        secret: authTokenSecret,
      ),
    );

    final firebaseUserCredential = await firebaseSignInWithTwitter(
        authToken: authToken, authTokenSecret: authTokenSecret);

    final twitterUID = firebaseUserCredential.user!.providerData.first.uid;
    final twitterAPIMe =
        await twitterAPIClient.userService.usersShow(userId: twitterUID);
    final user = User(
      id: firebaseUserCredential.user!.uid,
      twitterUserID: twitterAPIMe.idStr!,
      name: twitterAPIMe.name!,
      screenName: twitterAPIMe.screenName!,
      profileURL: twitterAPIMe.url!,
      profileImageURL: twitterAPIMe.profileImageUrlHttps!,
      createdDateTime: DateTime.now(),
    );

    return user;
  }

  Future<AuthResult> twitterLogin() {
    final twitterLogin = TwitterLogin(
      apiKey: TwitterAPISecret.apiKey,
      apiSecretKey: TwitterAPISecret.apiKeySecret,
      redirectURI: 'in100days://',
    );
    return twitterLogin.login();
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
  (ref) => LoginAsyncAction(
    secureStorage: ref.watch(secureStorageProvider),
  ),
);
