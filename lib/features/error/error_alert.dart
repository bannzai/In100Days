import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  final String? title;
  final String errorMessage;

  const ErrorAlert({Key? key, this.title, required this.errorMessage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title ?? "エラーが発生しました",
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      content: Text(
        errorMessage,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            "閉じる",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Colors.redAccent,
            ),
          ),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

void showErrorAlert(BuildContext context,
    {String? title, required Object error}) {
  showDialog(
    context: context,
    builder: (_) {
      return ErrorAlert(
        title: title,
        errorMessage: error.toString(),
      );
    },
  );
}
