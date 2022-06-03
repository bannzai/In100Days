import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
          ElevatedButton(
            child: const Text('Sign in with Twitter'),
            onPressed: () {
            },
          ),
      ],
    );
  }
}
