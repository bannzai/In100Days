import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/provider/twitter_api_client.dart';
import 'package:in_100_days/root.dart';
import 'package:in_100_days/style/color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupTwitterAPIClient();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColor.primary,
          inputDecorationTheme: const InputDecorationTheme(
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColor.primary),
            ),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColor.primary,
          ),
        ),
        home: const Root(),
      ),
    );
  }
}
