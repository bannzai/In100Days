import 'package:flutter/material.dart';
import 'package:in_100_days/style/button.dart';

class ErrorPage extends StatelessWidget {
  final Object error;
  final VoidCallback reload;

  const ErrorPage({Key? key, required this.error, required this.reload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Spacer(),
            Image.asset("images/computer_sagi_error.png"),
            Text(error.toString()),
            const SizedBox(height: 10),
            PrimaryButton(
                onPressed: () async {
                  reload();
                },
                text: "再読み込み"),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
