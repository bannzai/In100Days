import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:in_100_days/components/discard_dialog.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/provider/secure_storage.dart';
import 'package:in_100_days/secret/secret.dart';
import 'package:in_100_days/style/color.dart';
import 'package:in_100_days/utility/error_log.dart';
import 'package:twitter_login/twitter_login.dart';

class UserDeleteRow extends StatelessWidget {
  const UserDeleteRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(children: const [
        Text(
          "ユーザーを削除する",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        SizedBox(width: 8),
      ]),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return _alert(context);
            });
      },
    );
  }

  Widget _alert(BuildContext context) {
    return AlertDialog(
        title: const Icon(
          Icons.warning,
          color: AppColor.danger,
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "ユーザーを削除します",
              style: TextStyle(color: Colors.black, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text("ユーザーが削除されるとアプリ内にあるデータもすべて消えます",
                style: TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.center),
          ],
        ),
        actions: [
          TextButton(
            child: const Text(
              "削除する",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: AppColor.danger,
              ),
            ),
            onPressed: () async {
              try {
                await _delete(context);
              } on FirebaseAuthException catch (error, stackTrace) {
                if (error.code == "requires-recent-login") {
                  showDiscardDialog(
                    context,
                    title: "再ログインしてください",
                    message: "退会前に本人確認のために再ログインをしてください。再ログイン後、自動的に退会処理が始まります",
                    actions: [
                      TextButton(
                        child: const Text(
                          "再ログイン",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColor.danger,
                          ),
                        ),
                        onPressed: () async {
                          await _reauthentificate();
                          Navigator.of(context).pop();
                          await _delete(context);
                        },
                      ),
                      TextButton(
                        child: const Text(
                          "キャンセル",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                } else {
                  errorLogger.recordError(error, stackTrace);
                  showErrorAlert(context, error: error);
                }
              } catch (error) {
                showErrorAlert(context, error: error);
              }
            },
          ),
          TextButton(
            child: const Text(
              "キャンセル",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ]);
  }

  Future<void> _delete(BuildContext context) async {
    const securetStorage = FlutterSecureStorage();
    await securetStorage.delete(key: SecuretStorageKeys.twitterAuthToken);
    await securetStorage.delete(key: SecuretStorageKeys.twitterAuthTokenSecret);

    await FirebaseAuth.instance.currentUser?.delete();

    Navigator.of(context).pop();
  }

  Future<UserCredential> _reauthentificate() async {
    final twitterSignIn = TwitterLogin(
      apiKey: Secret.twitterApiKey,
      apiSecretKey: Secret.twitterApiKeySecret,
      redirectURI: 'in100days://',
    );
    final authResult = await twitterSignIn.login();
    final authToken = authResult.authToken;
    final authTokenSecret = authResult.authTokenSecret;
    if (authToken == null || authTokenSecret == null) {
      throw const FormatException("authToken or authTokenSecret is null");
    }

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw const FormatException("再認証に必要なUserの情報が見つかりません");
    }

    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authToken,
      secret: authTokenSecret,
    );
    return currentUser.reauthenticateWithCredential(twitterAuthCredential);
  }
}
