import 'package:flutter/material.dart';

class Pugya extends StatefulWidget {
  const Pugya({Key? key}) : super(key: key);

  @override
  PugyaState createState() {
    return PugyaState();
  }
}

class PugyaState extends State<Pugya> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Color color;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    controller.repeat(reverse: true);
    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    color = animation.value;

    animation.addListener(() {
      setState(() {
        color = animation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "m9(^Д^)ﾌﾟｷﾞｬｰ",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }
}
