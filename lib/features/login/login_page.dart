import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_twitter_api/twitter_api.dart' as twitterAPI;
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

                  if (authResult.authToken != null &&
                      authResult.authTokenSecret != null) {
                    // Store to secure storage
                    await secureStorage.write(
                      key: SecuretStorageKeys.twitterAuthToken,
                      value: authResult.authToken,
                    );
                    await secureStorage.write(
                      key: SecuretStorageKeys.twitterAuthTokenSecret,
                      value: authResult.authTokenSecret,
                    );

                    // Instantiate twitter API Client for app
                    twitterAPIClient = twitterAPI.TwitterApi(
                      client: twitterAPI.TwitterClient(
                        consumerKey: TwitterAPISecret.apiKey,
                        consumerSecret: TwitterAPISecret.apiKeySecret,
                        token: authResult.authToken!,
                        secret: authResult.authTokenSecret!,
                      ),
                    );

                    // Save twitter user profile to Firestore
                    final twitterAPIMe = await twitterAPIClient.client
                        .get(
                          Uri.https(
                              'api.twitter.com', '1.1/lists/subscribers.json'),
                        )
                        .then(twitterAPI.defaultUserTransform);
                    final user = User(
                        twitterUserID: twitterAPIMe.idStr!,
                        name: twitterAPIMe.name!,
                        screenName: twitterAPIMe.screenName!,
                        profileURL: twitterAPIMe.profileImageUrlHttps!,
                        profileImageURL: twitterAPIMe.profileImageUrlHttps!);
                    await ref
                        .read(userDocumentReferenceProvider)
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
