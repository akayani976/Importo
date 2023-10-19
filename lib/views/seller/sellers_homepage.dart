import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/views/general/single_bid_screen.dart';
import 'package:importo/widgets/headings.dart';

import '../../utilities/common_methods.dart';
import '../../utilities/size_config.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  int price = 0;

  @override
  Widget build(BuildContext context) {
    AppLayout().init(context);
    return Scaffold(
      // appBar: AppBar(
      //   leading: null,
      //   backgroundColor: AppColors().primaryThemeColor,
      //   title: const Text("Ongoing Bids"),
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(color: Colors.grey),
      //         child: Icon(
      //           Icons.person_rounded,
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text('Your Profile'),
      //         onTap: () {
      //           Get.to(
      //             () => const ProfilePage(),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Your Proposals'),
      //         onTap: () {
      //           // Get.to(
      //           //   () => const BidsListPage(),
      //           // );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenHeadings(
            mainHeadingText: 'Welcome to Importo',
            supportingHeadingText: 'Click on Ongoing Bids to See Details',
            topMargin: 120,
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(50),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: HelperMethods().getMyDynamicWidth(50),
            ),
            child: const Divider(
              color: Colors.black54,
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(50),
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => const SingleBidScreen(
                  route: 'Seller',
                ),
              );
            },
            child: bidTiles(),
          ),
        ],
      ),
    );
  }

  Widget bidTiles() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: HelperMethods().getMyDynamicWidth(50),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            HelperMethods().getMyDynamicHeight(30),
          ),
        ),
      ),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.all(
          Radius.circular(
            HelperMethods().getMyDynamicHeight(30),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: HelperMethods().getMyDynamicHeight(35),
          ),
          decoration: BoxDecoration(
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
                  backgroundColor: Colors.white,
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
                  left: HelperMethods().getMyDynamicWidth(10),
                ),
                child: const Text(
                  "Category:",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: HelperMethods().getMyDynamicWidth(180),
                ),
                child: Text(
                  "Price: $price",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getAllBids() {}
}
