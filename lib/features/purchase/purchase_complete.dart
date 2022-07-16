import 'package:flutter/material.dart';

import 'package:in_100_days/features/congratulation/owata.dart';
import 'package:in_100_days/style/button.dart';
import 'package:in_100_days/style/color.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseCompletePage extends StatelessWidget {
  final Product product;
  const PurchaseCompletePage({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "継",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textMain,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "続",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textMain,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "再",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textMain,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "開",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textMain,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Owata(),
              const SizedBox(height: 10),
              Image.asset("images/character_angel.png"),
              const SizedBox(height: 10),
              Text(
                "あなたの${product.priceString}の本気をいただきました",
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textMain,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'ふっかつのツイートをする',
                onPressed: () async {
                  // TODO:
                },
              ),
              const SizedBox(height: 10),
              GreyButton(
                  text: "閉じる", onPressed: () => Navigator.of(context).pop()),
            ],
          ),
        ),
      ),
    );
  }
}

extension PurchaseCompletePageRoute on PurchaseCompletePage {
  static Route<dynamic> route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "PurchaseCompletePage"),
      builder: (_) => PurchaseCompletePage(
        product: product,
      ),
      fullscreenDialog: true,
    );
  }
}
