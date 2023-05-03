import 'package:flutter/material.dart';
import 'package:importo/utilities/common_methods.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final double height;
  final double width;
  String text;

  Button({
    super.key,
    required this.height,
    required this.width,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 157, 210),
        borderRadius: BorderRadius.all(
            Radius.circular(HelperMethods().getMyDynamicHeight(40))),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
