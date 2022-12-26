import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final double height;

  const RoundedButtonWidget({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.black, blurRadius: 5.0)
          ]),
      child: Center(child: Text(text, style: const TextStyle(fontSize: 20.0))));
}
