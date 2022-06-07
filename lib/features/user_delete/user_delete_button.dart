import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/provider/secure_storage.dart';

class UserDeleteButton extends StatelessWidget {
  const UserDeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text("Delete User"),
        onPressed: () async {
          try {
            const securetStorage = FlutterSecureStorage();
            await securetStorage.delete(
                key: SecuretStorageKeys.twitterAuthToken);
            await securetStorage.delete(
                key: SecuretStorageKeys.twitterAuthTokenSecret);

            await FirebaseAuth.instance.currentUser?.delete();
          } catch (error) {
            showErrorAlert(context, error: error);
          }
        });
  }
}
