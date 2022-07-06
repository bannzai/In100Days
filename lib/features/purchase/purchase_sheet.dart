import 'package:flutter/material.dart';
import 'package:in_100_days/style/color.dart';

class PurchaseSheet extends StatelessWidget {
  const PurchaseSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 36,
              child: Center(
                child: Text(
                  "どのくらい本気を出す？",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.textNote),
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
            const Divider(),
            GestureDetector(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "¥370",
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
            const Divider(),
            GestureDetector(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "¥730",
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
            const Divider(),
            GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "¥1220",
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
            const Divider(),
            GestureDetector(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "¥12000",
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
            const Divider(),
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
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) => const PurchaseSheet(),
  );
}
