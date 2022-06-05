import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_twitter_api/twitter_api.dart' as twitter_api;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/features/login/login.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/secure_storage.dart';
import 'package:in_100_days/provider/twitter_api_client.dart';
import 'package:in_100_days/provider/user.dart';
import 'package:in_100_days/secret/secret.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secureStorage = ref.watch(secureStorageProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Sign in with Twitter'),
              onPressed: () async {
                try {
                  final authResult = await twitterLogin();
                  final authToken = authResult.authToken;
                  final authTokenSecret = authResult.authTokenSecret;

                  if (authToken != null && authTokenSecret != null) {
                    // Store to secure storage
                    await secureStorage.write(
                      key: SecuretStorageKeys.twitterAuthToken,
                      value: authToken,
                    );
                    await secureStorage.write(
                      key: SecuretStorageKeys.twitterAuthTokenSecret,
                      value: authTokenSecret,
                    );

                    // SignIn with Twitter
                    final twitterAuthCredential =
                        firebase_auth.TwitterAuthProvider.credential(
                      accessToken: authToken,
                      secret: authTokenSecret,
                    );
                    final firebaseAuthSignInResult = await firebase_auth.FirebaseAuth.instance
                        .signInWithCredential(twitterAuthCredential);

                    // Instantiate twitter API Client for app
                    twitterAPIClient = twitter_api.TwitterApi(
                      client: twitter_api.TwitterClient(
                        consumerKey: TwitterAPISecret.apiKey,
                        consumerSecret: TwitterAPISecret.apiKeySecret,
                        token: authToken,
                        secret: authTokenSecret,
                      ),
                    );

                    // Save twitter user profile to Firestore
                    final twitterAPIMe = await twitterAPIClient.client
                        .get(
                          Uri.https(
                              'api.twitter.com', '1.1/lists/subscribers.json'),
                        )
                        .then(twitter_api.defaultUserTransform);
                    final user = User(
                        twitterUserID: twitterAPIMe.idStr!,
                        name: twitterAPIMe.name!,
                        screenName: twitterAPIMe.screenName!,
                        profileURL: twitterAPIMe.profileImageUrlHttps!,
                        profileImageURL: twitterAPIMe.profileImageUrlHttps!);
                    await ref
                        .read(userDocumentReferenceProvider(
                            firebaseAuthSignInResult.user!.uid))
                        .set(user, SetOptions(merge: true));
                  }

                  // Reload app
                  ref.refresh(authInfoProvider);
                } catch (error) {
                  showErrorAlert(context, error: error);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
