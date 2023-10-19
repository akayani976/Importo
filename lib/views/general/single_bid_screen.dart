import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/strip_service.dart';
import 'package:importo/widgets/buttons.dart';
import '../../utilities/common_methods.dart';
import '../../widgets/back_button.dart';
import '../seller/create_proposal.dart';

class SingleBidScreen extends StatefulWidget {
  final String route;
  const SingleBidScreen({required this.route, super.key});

  @override
  State<SingleBidScreen> createState() => _SingleBidScreenState();
}

class _SingleBidScreenState extends State<SingleBidScreen> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(
            HelperMethods().getMyDynamicHeight(120),
          ),
          const BackArrowButton(),
          Container(
            margin: EdgeInsets.only(
              top: HelperMethods().getMyDynamicHeight(70),
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            height: HelperMethods().getMyDynamicHeight(200),
            width: HelperMethods().getMyDynamicWidth(200),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Center(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: HelperMethods().getMyDynamicHeight(100),
                ),
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(100),
          ),
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            child: Text(
              widget.route == 'Buyer' ? 'Seller Name' : 'Buyer Name',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: HelperMethods().getMyDynamicFontSize(20),
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(100),
          ),
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            child: Text(
              'Category:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: HelperMethods().getMyDynamicFontSize(20),
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(100),
          ),
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            child: Row(
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: HelperMethods().getMyDynamicFontSize(20),
                  ),
                ),
                Gap(
                  HelperMethods().getMyDynamicHeight(250),
                ),
                Text(
                  'Price:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: HelperMethods().getMyDynamicFontSize(20),
                  ),
                ),
              ],
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(100),
          ),
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            child: Text(
              "Sender's Address:",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: HelperMethods().getMyDynamicFontSize(20),
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(100),
          ),
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            child: Text(
              'Message From Seller:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: HelperMethods().getMyDynamicFontSize(20),
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    isTapped = true;
                  });
                  widget.route == 'Buyer'
                      ? paymentSheet()
                      : Get.to(
                          () => const CreateProposalPage(),
                        );
                  setState(() {
                    isTapped = false;
                  });
                },
                child: Button(
                  height: 195,
                  width: 980,
                  text: widget.route == 'Buyer'
                      ? "Accept Bid"
                      : "Create Proposal",
                  isTapped: isTapped,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  paymentSheet() {
    var items = [
      {
        "productPrice": 4,
        "productName": "Apple",
        "qty": 5,
      },
      {"productPrice": 4, "productName": "Apple", "qty": 5},
      {"productPrice": 5, "productName": "Pineapple", "qty": 10}
    ];
    StripService.stripePaymentCheckout(items, 500, context);
  }
}
