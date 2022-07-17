import 'package:flutter/material.dart';
import 'package:in_100_days/style/color.dart';

class DiscardDialog extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget> actions;

  const DiscardDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.actions,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Icon(Icons.warning, color: AppColor.danger),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (title.isNotEmpty) ...[
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textMain),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
          Text(
            message,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.textMain),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: actions,
    );
  }
}

showDiscardDialog(
  BuildContext context, {
  required String title,
  required String message,
  required List<Widget> actions,
}) {
  showDialog(
    context: context,
    builder: (context) => DiscardDialog(
      title: title,
      message: message,
      actions: actions,
    ),
  );
}
