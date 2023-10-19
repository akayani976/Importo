import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utilities/common_methods.dart';

class ScreenHeadings extends StatelessWidget {
  final String mainHeadingText;
  final String supportingHeadingText;
  final double topMargin;
  const ScreenHeadings(
      {super.key,
      required this.mainHeadingText,
      required this.supportingHeadingText,
      required this.topMargin});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: HelperMethods().getMyDynamicHeight(topMargin),
            left: HelperMethods().getMyDynamicWidth(50),
          ),
          child: Text(
            mainHeadingText,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: HelperMethods().getMyDynamicFontSize(24),
            ),
          ),
        ),
        Gap(
          HelperMethods().getMyDynamicHeight(60),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: HelperMethods().getMyDynamicWidth(50),
          ),
          child: Text(
            supportingHeadingText,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: HelperMethods().getMyDynamicFontSize(16),
              color: Colors.black38,
            ),
          ),
        ),
      ],
    );
  }
}
