import 'package:dart_twitter_api/twitter_api.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/features/login/login.dart';
import 'package:in_100_days/provider/auth.dart';
import 'package:in_100_days/provider/secure_storage.dart';
import 'package:in_100_days/provider/twitter_api_client.dart';
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
                    await secureStorage.write(
                      key: SecuretStorageKeys.twitterAuthToken,
                      value: authResult.authToken,
                    );
                    await secureStorage.write(
                      key: SecuretStorageKeys.twitterAuthTokenSecret,
                      value: authResult.authTokenSecret,
                    );

                    twitterAPIClient = TwitterApi(
                      client: TwitterClient(
                        consumerKey: TwitterAPISecret.apiKey,
                        consumerSecret: TwitterAPISecret.apiKeySecret,
                        token: authResult.authToken!,
                        secret: authResult.authTokenSecret!,
                      ),
                    );
                  }

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
