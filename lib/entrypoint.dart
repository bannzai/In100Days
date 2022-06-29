import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:in_100_days/provider/twitter_api_client.dart';

import 'app.dart';

void entrypoint() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupTwitterAPIClient();
  runApp(const MyApp());
}