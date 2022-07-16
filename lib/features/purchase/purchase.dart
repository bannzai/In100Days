import 'dart:io';

import 'package:in_100_days/flavors.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../secret/secret.dart';

const defaultEntitlementKey = "default";

Future<void> initializePurchase() async {
  await Purchases.setDebugLogsEnabled(F.appFlavor == Flavor.DEV);
  if (Platform.isIOS) {
    await Purchases.setup(Secret.iOSRevenueCatPublicAPIKey);
  } else if (Platform.isAndroid) {
    await Purchases.setup(Secret.androidRevenueCatPublicAPIKey);
  } else {
    exit(1);
  }
}
