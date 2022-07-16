import 'package:flutter/material.dart';
import 'package:in_100_days/components/kirakira.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/entity/user.codegen.dart';
import 'package:in_100_days/features/record_add/record_add_sheet.dart';

import 'package:in_100_days/style/button.dart';
import 'package:in_100_days/style/color.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseCompletePage extends StatelessWidget {
  final Product product;
  final User user;
  final Goal goal;
  const PurchaseCompletePage({
    Key? key,
    required this.product,
    required this.user,
    required this.goal,
  }) : super(key: key);

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
              const Kirakira(message: "（　＾ω＾）b"),
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
                  showRecordAddSheet(
                    context,
                    initialMessage:
                        "${product.priceString}を代償に ${goal.fullHashTag} を再開しました",
                    goal: goal,
                    user: user,
                    onPost: (tweet, text, recordAddSheetContext) async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("ツイートしました"),
                        ),
                      );

                      Navigator.of(recordAddSheetContext).pop();
                      Navigator.of(context).pop();
                    },
                  );
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
  static Route<dynamic> route(
      {required Product product, required User user, required Goal goal}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "PurchaseCompletePage"),
      builder: (_) => PurchaseCompletePage(
        product: product,
        user: user,
        goal: goal,
      ),
      fullscreenDialog: true,
    );
  }
}
