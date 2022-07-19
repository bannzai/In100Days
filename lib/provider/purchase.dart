import 'dart:io';

import 'package:in_100_days/flavors.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod/riverpod.dart';

List<String> productIdentifiers() {
  if (F.appFlavor == Flavor.DEV) {
    if (Platform.isIOS) {
      return [
        "in100days_dev_120_consume",
        "in100days_dev_370_consume",
        "in100days_dev_730_consume",
        "in100days_dev_1220_consume",
        "in100days_dev_12000_consume",
      ];
    } else {
      return [
        "in100days_dev2_120_consume",
        "in100days_dev2_370_consume",
        "in100days_dev2_730_consume",
        "in100days_dev2_1220_consume",
        "in100days_dev2_12000_consume",
      ];
    }
  } else {
    return [
      "in100days_120_consume",
      "in100days_370_consume",
      "in100days_730_consume",
      "in100days_1220_consume",
      "in100days_12000_consume",
    ];
  }
}

final purchaseProductsProvider = FutureProvider((ref) async {
  final products = await Purchases.getProducts(productIdentifiers(),
      type: PurchaseType.inapp);
  return products..sort((a, b) => a.price > b.price ? 1 : 0);
});
