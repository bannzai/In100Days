import 'package:flutter/material.dart';
import 'package:in_100_days/components/kirakira.dart';
import 'package:in_100_days/entity/goal.codegen.dart';
import 'package:in_100_days/features/game_over/pugya.dart';
import 'package:in_100_days/features/purchase/purchase_complete.dart';
import 'package:in_100_days/features/purchase/purchase_sheet.dart';
import 'package:in_100_days/style/color.dart';

import '../../style/button.dart';

class GameOverPage extends StatelessWidget {
  final Goal goal;
  final String userID;
  const GameOverPage({
    Key? key,
    required this.goal,
    required this.userID,
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
                    "失",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColor.textMain,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "敗",
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
              const Kirakira(message: "m9(^Д^)ﾌﾟｷﾞｬｰ"),
              const SizedBox(height: 10),
              Image.asset("images/omori_futan_woman.png"),
              const SizedBox(height: 10),
              const Text(
                "本気で再開をするなら少しのお金くらい払えますよね？",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: AppColor.textMain,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryButton(
                text: '本気で再開する',
                onPressed: () async {
                  showPurchaseSheet(context,
                      goal: goal,
                      userID: userID,
                      onPurchased: (product) => Navigator.of(context).push(
                          PurchaseCompletePageRoute.route(product: product)));
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

extension GameOverPageRoute on GameOverPage {
  static Route<dynamic> route({required Goal goal, required String userID}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: "GameOverPage"),
      builder: (_) => GameOverPage(
        goal: goal,
        userID: userID,
      ),
      fullscreenDialog: true,
    );
  }
}
