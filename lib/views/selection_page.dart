import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/views/buyers_homepage.dart';
import 'package:importo/views/sellers_homepage.dart';

class SelectionPage extends StatelessWidget {
  const SelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const SellerHomePage());
            },
            child: Container(
              height: HelperMethods().getMyDynamicHeight(1170),
              width: HelperMethods().getMyDynamicWidth(1080),
              color: const Color.fromARGB(255, 65, 193, 186),
              child: Center(
                  child: Text(
                'Are you a seller?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: HelperMethods().getMyDynamicFontSize(30),
                ),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const BuyerHomePage());
            },
            child: Container(
              height: HelperMethods().getMyDynamicHeight(1170),
              width: HelperMethods().getMyDynamicWidth(1080),
              color: const Color.fromARGB(255, 40, 157, 210),
              child: Center(
                  child: Text(
                'Or are you a buyer?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: HelperMethods().getMyDynamicFontSize(30),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
