import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/widgets/buttons.dart';

class SellerHomePage extends StatelessWidget {
  const SellerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: HelperMethods().getMyDynamicHeight(2340),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: HelperMethods().getMyDynamicWidth(40)),
          child: Column(
            children: [
              SizedBox(
                  height: HelperMethods().getMyDynamicHeight(800),
                  width: HelperMethods().getMyDynamicWidth(1080),
                  child: const Image(image: AssetImage('assets/importo.png'))),
              Button(
                  height: HelperMethods().getMyDynamicHeight(195),
                  width: HelperMethods().getMyDynamicWidth(1080),
                  text: 'View ongoing bids'),
              Gap(HelperMethods().getMyDynamicHeight(40)),
              Button(
                  height: HelperMethods().getMyDynamicHeight(195),
                  width: HelperMethods().getMyDynamicWidth(1080),
                  text: 'View your bid history'),
              Gap(HelperMethods().getMyDynamicHeight(40)),
              Button(
                  height: HelperMethods().getMyDynamicHeight(195),
                  width: HelperMethods().getMyDynamicWidth(1080),
                  text: 'Bid analytics'),
            ],
          ),
        ),
      ),
    );
  }
}
