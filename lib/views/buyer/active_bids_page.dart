import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/colors.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/utilities/config.dart';
import 'package:importo/utilities/user.dart';
import 'package:importo/views/general/single_bid_screen.dart';
import 'package:http/http.dart' as http;

class ActiveBidsPage extends StatefulWidget {
  const ActiveBidsPage({super.key});

  @override
  State<ActiveBidsPage> createState() => _ActiveBidsPageState();
}

class _ActiveBidsPageState extends State<ActiveBidsPage> {
  int price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incoming Bids"),
        backgroundColor: AppColors().primaryThemeColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(
            HelperMethods().getMyDynamicHeight(50),
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => const SingleBidScreen(
                  route: 'Buyer',
                ),
              );
            },
            child: bidTiles(),
          ),
        ],
      ),
    );
  }

  Future<void> getBidResponse() async {
    var regBody = {"bidId": MyUser.userId};
    var response = await http.post(
      Uri.parse(getbidresponse),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody),
    );
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse["status"]) {}
  }

  Widget bidTiles() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: HelperMethods().getMyDynamicWidth(50),
      ),
      padding: EdgeInsets.symmetric(
        vertical: HelperMethods().getMyDynamicHeight(35),
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 66, 194, 190),
        borderRadius: BorderRadius.all(
          Radius.circular(
            HelperMethods().getMyDynamicHeight(30),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(
            HelperMethods().getMyDynamicWidth(50),
          ),
          SizedBox(
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
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            child: Text(
              "Price: $price",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(100),
            ),
            child: const Text(
              "Location:",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
    // return FutureBuilder(
    //   future: getBidResponse(),
    //   builder: (context, snapshot) {
    //     return
    //   },
    // );
  }
}
