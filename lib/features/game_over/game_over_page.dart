import 'package:flutter/material.dart';
import 'package:in_100_days/style/color.dart';

import '../../style/button.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "継続失敗です",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: AppColor.textMain,
          ),
        ),
        const SizedBox(height: 10),
        Image.asset("images/omori_futan_woman.png"),
        const SizedBox(height: 10),
        const Text(
          "本気で再会をするなら少しのお金くらい払えますよl？",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: AppColor.textMain,
          ),
          textAlign: TextAlign.center,
        ),
        PrimaryButton(
          text: '本気で再開する',
          onPressed: () async {},
        ),
      ],
    );
  }
}
