import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utilities/common_methods.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: EdgeInsets.only(
          left: HelperMethods().getMyDynamicWidth(50),
        ),
        child: const Icon(IconData(0xe092,
            fontFamily: 'MaterialIcons', matchTextDirection: true)),
      ),
    );
  }
}
