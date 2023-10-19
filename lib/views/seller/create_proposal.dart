import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/views/seller/sellers_homepage.dart';
import 'package:importo/widgets/back_button.dart';
import 'package:importo/widgets/buttons.dart';
import 'package:importo/widgets/headings.dart';
import '../../utilities/user.dart';
import '../../utilities/config.dart';

class CreateProposalPage extends StatefulWidget {
  const CreateProposalPage({super.key});

  @override
  State<CreateProposalPage> createState() => _CreateProposalPageState();
}

class _CreateProposalPageState extends State<CreateProposalPage> {
  TextEditingController location = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Create a Proposal"),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(
            HelperMethods().getMyDynamicHeight(120),
          ),
          const BackArrowButton(),
          const ScreenHeadings(
              mainHeadingText: 'Create a Proposal',
              supportingHeadingText:
                  "Fill in the details below to send your proposal for this bid.",
              topMargin: 120),
          Gap(
            HelperMethods().getMyDynamicHeight(100),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: HelperMethods().getMyDynamicWidth(50),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Quote Your Price',
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(50),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: HelperMethods().getMyDynamicWidth(50),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Quote Your Price',
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(50),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: HelperMethods().getMyDynamicWidth(50),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Fill In Your Address',
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(70),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: HelperMethods().getMyDynamicWidth(50),
            ),
            child: const TextField(
              maxLines: 5,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a description or a message for the buyer...',
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(390),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTapped = true;
                  });
                  createBidResponse();
                  setState(() {
                    isTapped = false;
                  });
                },
                child: Button(
                  height: 195,
                  width: 980,
                  text: "Send Proposal",
                  isTapped: isTapped,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void createBidResponse() async {
    try {
      var regBody = {
        "bidID": MyUser.userId,
        "location": location.text,
        "description": description.text,
        "quantity": quantity.text,
        "price": price.text,
        // "category": category
      };
      var response = await http.post(
        Uri.parse(createbid),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody),
      );
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        Get.snackbar(
          "Success",
          "Your bid was successfully created!",
          icon: const Icon(Icons.check_box, color: Colors.green),
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.off(() => const SellerHomePage());
        // Navigator.pop(context);
        // getBid(userId);
      } else {}
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        icon: const Icon(Icons.warning, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
