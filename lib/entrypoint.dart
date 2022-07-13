import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_100_days/provider/twitter_api_client.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'features/purchase/purchase.dart';
import 'firebase_options.dart';

import 'app.dart';

Future<void> entrypoint() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await setupTwitterAPIClient();
    await initializePurchase();

    if (kDebugMode) {
      PackageInfo.fromPlatform().then((package) {
        debugPrint("App is ${package.packageName}");
      });
    }

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    runApp(const MyApp());
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}
