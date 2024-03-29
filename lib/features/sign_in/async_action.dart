import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/provider/secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
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
      // Remove _normal. Reference: https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/user-profile-images-and-banners
      orignalProfileImageURL:
          twitterAPIProfileImageURL.replaceFirst("_normal", ""),
      createdDateTime: DateTime.now(),
    );

    return user;
  }

  Future<User> updateTwitterUser(User user) async {
    await setupTwitterAPIClient();
    const secureStorage = FlutterSecureStorage();
    final twitterAuthToken =
    await secureStorage.read(key: SecuretStorageKeys.twitterAuthToken);
    final twitterAuthTokenSecret =
    await secureStorage.read(key: SecuretStorageKeys.twitterAuthTokenSecret);
    if (twitterAuthToken == null || twitterAuthTokenSecret == null) {
      throw const FormatException("authToken or authTokenSecret is null");
    }
    final firebaseUserCredential = await firebaseSignInWithTwitter(
        authToken: twitterAuthToken, authTokenSecret: twitterAuthTokenSecret);

    final twitterUID = firebaseUserCredential.user!.providerData.first.uid;
    final twitterAPIMe =
    await twitterAPIClient.userService.usersShow(userId: twitterUID);

    final twitterAPIProfileImageURL = twitterAPIMe.profileImageUrlHttps!;
    final updateUser = user.copyWith(
      name: twitterAPIMe.name!,
      screenName: twitterAPIMe.screenName!,
      twitterAPIProfileImageURL: twitterAPIProfileImageURL,
      // Remove _normal. Reference: https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/user-profile-images-and-banners
      orignalProfileImageURL:
      twitterAPIProfileImageURL.replaceFirst("_normal", ""),
    );

    return updateUser;
  }

  Future<AuthResult> twitterSignIn() async {
    final package = await PackageInfo.fromPlatform();
    final twitterSignIn = TwitterLogin(
      apiKey: Secret.twitterApiKey,
      apiSecretKey: Secret.twitterApiKeySecret,
      redirectURI: package.packageName + "://",
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
