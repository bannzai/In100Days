import 'package:flutter/material.dart';

class PurchaseSheet extends StatelessWidget {
  const PurchaseSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 20, top: 24, left: 16, right: 16),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "¥120",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: " の本気を出す",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                // TODO:
              },
            ),
          ],
        ),
      ),
    );
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
