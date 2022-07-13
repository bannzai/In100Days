import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final Object error;

  const ErrorPage({Key? key, required this.error}) : super(key: key);

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
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
