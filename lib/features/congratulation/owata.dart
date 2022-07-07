import 'package:flutter/material.dart';

class Owata extends StatefulWidget {
  const Owata({Key? key}) : super(key: key);

  @override
  OwataState createState() {
    return OwataState();
  }
}

class OwataState extends State<Owata> with SingleTickerProviderStateMixin {
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "＼（^o^）／",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }
}
