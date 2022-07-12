import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_100_days/features/error/error_page.dart';
import 'package:in_100_days/provider/purchase.dart';
import 'package:in_100_days/style/color.dart';

class PurchaseSheet extends HookConsumerWidget {
  const PurchaseSheet({Key? key}) : super(key: key);

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
                    onTap: () {
                      // TODO:
                    },
                  ),
                  const Divider(),
                ],
              ],
            ),
          ),
        );
      },
      error: (error, st) => ErrorPage(error: error),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

void showPurchaseSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    enableDrag: true,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) => const PurchaseSheet(),
  );
}
