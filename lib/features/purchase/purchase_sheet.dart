import 'package:flutter/material.dart';

class PurchaseSheet extends StatelessWidget {
  const PurchaseSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("本気出す"),
    ]);
  }
}

void showPurchaseSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    enableDrag: true,
    context: context,
    builder: (BuildContext context) => const PurchaseSheet(),
  );
}
