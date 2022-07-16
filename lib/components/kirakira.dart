import 'package:flutter/material.dart';

class Kirakira extends StatefulWidget {
  final String message;
  const Kirakira({Key? key, required this.message}) : super(key: key);

  @override
  KirakiraState createState() {
    return KirakiraState();
  }
}

class KirakiraState extends State<Kirakira>
    with SingleTickerProviderStateMixin {
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
      widget.message,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      textAlign: TextAlign.center,
    );
  }
}
