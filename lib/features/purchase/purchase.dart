import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:in_100_days/flavors.dart';
import 'package:in_100_days/provider/user.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../secret/secret.dart';
import '../../utility/analytics.dart';
import '../../utility/error_log.dart';

const defaultEntitlementKey = "default";

Future<void> initializePurchase(String uid) async {
  await Purchases.setDebugLogsEnabled(F.appFlavor == Flavor.DEV);
  if (Platform.isIOS) {
    await Purchases.setup(Secret.iOSRevenueCatPublicAPIKey, appUserId: uid);
  } else if (Platform.isAndroid) {
    await Purchases.setup(Secret.androidRevenueCatPublicAPIKey, appUserId: uid);
  } else {
    exit(1);
  }
  Purchases.addPurchaserInfoUpdateListener(
      (info) => callUpdatePurchaseInfo(info, uid));
  await syncPurchaseInfo(uid);
}

Future<void> callUpdatePurchaseInfo(PurchaserInfo info, String uid) async {
  analytics.logEvent(name: "start_update_purchase_info");

  try {
    await _updatePurchaseInfo(info: info, userID: uid);
    analytics.logEvent(name: "end_update_purchase_info");
  } catch (exception, stack) {
    errorLogger.recordError(exception, stack);
  }
}

Future<void> syncPurchaseInfo(String uid) async {
  analytics.logEvent(name: "start_sync_purchase_info");

  try {
    await _updatePurchaseInfo(
        info: await Purchases.getPurchaserInfo(), userID: uid);
    analytics.logEvent(name: "end_sync_purchase_info");
  } catch (exception, stack) {
    errorLogger.recordError(exception, stack);
  }
}

class _UpdatePurchaseInfo {
  Future<void> call(
      {required PurchaserInfo info, required String userID}) async {
    final reference = userDocumentPrivateReference(userID: userID);
    final entitlement = info.entitlements.all[defaultEntitlementKey];
    await reference.set({
      "purchaseInfo": {
        "isActivated": entitlement?.isActive,
        "entitlementIdentifier": entitlement?.identifier,
        "premiumPlanIdentifier": entitlement?.productIdentifier,
        "purchaseAppID": info.originalAppUserId,
        "activeSubscriptions": info.activeSubscriptions,
        "originalPurchaseDate": info.originalPurchaseDate,
        "updatedDateTime": DateTime.now(),
      }
    }, SetOptions(merge: true));
  }
}

final _updatePurchaseInfo = _UpdatePurchaseInfo();
