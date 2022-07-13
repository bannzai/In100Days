import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/features/error/error_alert.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/features/purchase/purchase.dart';
import 'package:in_100_days/provider/goal.dart';
import 'package:in_100_days/provider/purchase.dart';
import 'package:in_100_days/style/color.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseSheet extends HookConsumerWidget {
  final Goal goal;
  final String userID;
  final Function(Product) onPurchased;
  const PurchaseSheet({
    Key? key,
    required this.goal,
    required this.userID,
    required this.onPurchased,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseProducts = ref.watch(purchaseProductsProvider);
    return purchaseProducts.when(
      data: (purchaseProducts) {
        return Container(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          color: Colors.white,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 36,
                  child: Center(
                    child: Text(
                      "どのくらい本気を出す？",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColor.textNote),
                    ),
                  ),
                ),
                const Divider(),
                for (final purchaseProduct in purchaseProducts) ...[
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: purchaseProduct.priceString,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const TextSpan(
                              text: " の本気を出す",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () async {
                      try {
                        final purchaserInfo = await Purchases.purchaseProduct(
                            purchaseProduct.identifier);
                        await callUpdatePurchaseInfo(purchaserInfo, userID);

                        final updatedPurchasedProducts = [
                          ...goal.purchasedProducts,
                          purchaseProduct
                        ];
                        await ref.read(setGoalProvider).call(
                            goal.copyWith(
                                purchasedProducts: updatedPurchasedProducts),
                            userID: userID);

                        Navigator.of(context).pop();

                        onPurchased(purchaseProduct);
                      } catch (error) {
                        showErrorAlert(context, error: error);
                      }
                    },
                  ),
                  const Divider(),
                ],
              ],
            ),
          ),
        );
      },
      error: (error, st) => ErrorPage(
          error: error, reload: () => ref.refresh(purchaseProductsProvider)),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

void showPurchaseSheet(
  BuildContext context, {
  required Goal goal,
  required String userID,
  required Function(Product) onPurchased,
}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    enableDrag: true,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) => PurchaseSheet(
      goal: goal,
      userID: userID,
      onPurchased: onPurchased,
    ),
  );
}
