import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/root.dart';
import 'package:in_100_days/style/color.dart';

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
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
            ),
          ),
        ),
        home: const Root(),
      ),
    );
  }
}
