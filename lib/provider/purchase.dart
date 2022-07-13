import 'package:in_100_days/features/purchase/purchase.dart';
import 'package:in_100_days/flavors.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod/riverpod.dart';

List<String> productIdentifiers() {
  if (F.appFlavor == Flavor.DEV) {
    return [
      "in100days_dev_120_consume",
      "in100days_dev_370_consume",
      "in100days_dev_730_consume",
      "in100days_dev_1220_consume",
      "in100days_dev_12000_consume",
    ];
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
  final products = await Purchases.getProducts(productIdentifiers());
  return products..sort((a, b) => a.price > b.price ? 1 : 0);
});