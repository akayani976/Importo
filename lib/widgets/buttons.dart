import 'package:flutter/material.dart';
import 'package:importo/utilities/colors.dart';
import 'package:importo/utilities/common_methods.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  final double height;
  final double width;
  String text;
  bool isTapped;

  Button({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.isTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HelperMethods().getMyDynamicHeight(height),
      width: HelperMethods().getMyDynamicWidth(width),
      decoration: BoxDecoration(
        color: AppColors().secondaryThemeColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            HelperMethods().getMyDynamicHeight(40),
          ),
        ),
      ),
      child: Center(
        child: isTapped
            ? CircularProgressIndicator(
                color: AppColors().primaryThemeColor,
              )
            : Text(
                text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
      ),
    );
  }
}
