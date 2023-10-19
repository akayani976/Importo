import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/views/seller/seller_page_bottom_navbar.dart';
import 'package:importo/widgets/buttons.dart';

class KYCPage extends StatefulWidget {
  const KYCPage({super.key});

  @override
  State<KYCPage> createState() => _KYCPageState();
}

class _KYCPageState extends State<KYCPage> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Collection'),
        leading: null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: HelperMethods().getMyDynamicHeight(500),
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            height: HelperMethods().getMyDynamicHeight(500),
            width: HelperMethods().getMyDynamicWidth(980),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_circle_outline_outlined),
                  Container(
                    margin: EdgeInsets.only(
                      left: HelperMethods().getMyDynamicWidth(50),
                    ),
                    child: const Text(
                      'Add ID card',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: HelperMethods().getMyDynamicHeight(80),
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            height: HelperMethods().getMyDynamicHeight(500),
            width: HelperMethods().getMyDynamicWidth(980),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_circle_outline_outlined),
                  Container(
                    margin: EdgeInsets.only(
                      left: HelperMethods().getMyDynamicWidth(50),
                    ),
                    child: const Text(
                      'Add proof of business',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = true;
              });
              Get.off(() => const SellerPageBottomNavBar());
              setState(() {
                isTapped = false;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                top: HelperMethods().getMyDynamicHeight(200),
                left: HelperMethods().getMyDynamicWidth(50),
              ),
              child: Button(
                height: 195,
                width: 980,
                text: 'Submit Documents',
                isTapped: isTapped,
              ),
            ),
          )
        ],
      ),
    );
  }
}
