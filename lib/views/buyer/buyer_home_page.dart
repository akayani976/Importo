import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/colors.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/utilities/config.dart';
import 'package:importo/widgets/buttons.dart';
import 'package:http/http.dart' as http;
import 'package:importo/widgets/headings.dart';
import '../../utilities/user.dart';
import 'active_bids_page.dart';

class BuyerHomePage extends StatefulWidget {
  const BuyerHomePage({super.key});

  @override
  State<BuyerHomePage> createState() => _BuyerHomePageState();
}

class _BuyerHomePageState extends State<BuyerHomePage> {
  // late String userId;
  /// This userId is hard coded for now. Should be the Id of the user which is signed in
  String userId = MyUser.userId;

  TextEditingController location = TextEditingController();
  TextEditingController quatity = TextEditingController();
  TextEditingController budget = TextEditingController();
  TextEditingController description = TextEditingController();
  String category = 'Cotton Yarn';
  bool isTapped = false;
  List? items;

  @override
  // void initState() {
  //   Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode();
  //   userId = jwtDecodedToken['_id'];
  //   getBid(userId);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: AppColors().secondaryThemeColor,
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
        //         title: const Text('Your Bids'),
        //         onTap: () {
        //           Get.to(
        //             () => const BidsListPage(),
        //           );
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: HelperMethods().getMyDynamicHeight(410),
            width: HelperMethods().getMyDynamicWidth(1080),
            child: const ScreenHeadings(
              mainHeadingText: 'Create a Bid',
              supportingHeadingText:
                  'Fill in all of the fields below to create a bid of your preference',
              topMargin: 120,
            ),
          ),
          const Divider(
            color: Colors.black54,
          ),
          Container(
            padding: EdgeInsets.only(
                top: HelperMethods().getMyDynamicHeight(20),
                left: HelperMethods().getMyDynamicHeight(50),
                right: HelperMethods().getMyDynamicHeight(50)),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(HelperMethods().getMyDynamicHeight(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: HelperMethods().getMyDynamicHeight(225),
                      width: HelperMethods().getMyDynamicWidth(225),
                      padding: EdgeInsets.all(
                        HelperMethods().getMyDynamicHeight(15),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors().secondaryThemeColor,
                        border: category == 'Cotton Yarn'
                            ? Border.all(
                                color: AppColors().primaryThemeColor, width: 5)
                            : null,
                        borderRadius: BorderRadius.circular(
                          HelperMethods().getMyDynamicHeight(50),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                category = 'Cotton Yarn';
                              });
                            },
                            child: Container(
                              height: HelperMethods().getMyDynamicHeight(120),
                              width: HelperMethods().getMyDynamicWidth(125),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    HelperMethods().getMyDynamicHeight(30),
                                  ),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage('assets/cotton_yarn.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Gap(HelperMethods().getMyDynamicHeight(15)),
                          Text(
                            'Cotton Yarn',
                            style: TextStyle(
                                fontSize:
                                    HelperMethods().getMyDynamicHeight(25),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: HelperMethods().getMyDynamicHeight(225),
                      width: HelperMethods().getMyDynamicWidth(225),
                      padding: EdgeInsets.all(
                          HelperMethods().getMyDynamicHeight(15)),
                      decoration: BoxDecoration(
                        color: AppColors().secondaryThemeColor,
                        border: category == 'Thread'
                            ? Border.all(
                                color: AppColors().primaryThemeColor, width: 5)
                            : null,
                        borderRadius: BorderRadius.circular(
                          HelperMethods().getMyDynamicHeight(50),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                category = 'Thread';
                              });
                            },
                            child: Container(
                              height: HelperMethods().getMyDynamicHeight(120),
                              width: HelperMethods().getMyDynamicWidth(125),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      HelperMethods().getMyDynamicHeight(30)),
                                  image: const DecorationImage(
                                      image: AssetImage('assets/thread.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Gap(HelperMethods().getMyDynamicHeight(15)),
                          Text(
                            'Thread',
                            style: TextStyle(
                                fontSize:
                                    HelperMethods().getMyDynamicHeight(25),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: HelperMethods().getMyDynamicHeight(225),
                      width: HelperMethods().getMyDynamicWidth(225),
                      padding: EdgeInsets.all(
                        HelperMethods().getMyDynamicHeight(15),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors().secondaryThemeColor,
                        border: category == 'Finished Products'
                            ? Border.all(
                                color: AppColors().primaryThemeColor, width: 5)
                            : null,
                        borderRadius: BorderRadius.circular(
                          HelperMethods().getMyDynamicHeight(50),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              category = 'Finished Products';
                            },
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: HelperMethods().getMyDynamicHeight(125),
                              width: HelperMethods().getMyDynamicWidth(125),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    HelperMethods().getMyDynamicHeight(30),
                                  ),
                                  image: const DecorationImage(
                                      image: AssetImage('assets/shirt.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            Gap(
                              HelperMethods().getMyDynamicHeight(15),
                            ),
                            Text(
                              'Finished Products',
                              style: TextStyle(
                                  fontSize:
                                      HelperMethods().getMyDynamicHeight(20),
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(
                  HelperMethods().getMyDynamicHeight(30),
                ),
                TextField(
                  controller: location,
                  decoration: const InputDecoration(
                    hintText: 'What is your delivery location?',
                  ),
                ),
                Gap(
                  HelperMethods().getMyDynamicHeight(30),
                ),
                TextField(
                  controller: quatity,
                  decoration: const InputDecoration(
                    hintText: 'What is the quantity you require?',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                Gap(
                  HelperMethods().getMyDynamicHeight(30),
                ),
                TextField(
                  controller: budget,
                  decoration: const InputDecoration(
                    hintText: 'What is your preferred budget?',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                Gap(
                  HelperMethods().getMyDynamicHeight(30),
                ),
                TextField(
                  controller: description,
                  maxLines: 5,
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Add a description...',
                  ),
                ),
                Gap(
                  HelperMethods().getMyDynamicHeight(40),
                ),
                GestureDetector(
                  onTap: () async {
                    // setState(() {
                    //   isTapped = true;
                    // });
                    // createBid();
                    Get.to(
                      () => const ActiveBidsPage(),
                    );
                    // setState(() {
                    //   isTapped = false;
                    // });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: HelperMethods().getMyDynamicHeight(80),
                    ),
                    child: Button(
                      height: 195,
                      width: 1080,
                      text: 'Create Bid',
                      isTapped: isTapped,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Future createBid() async {
    if (location.text.isNotEmpty &&
        quatity.text.isNotEmpty &&
        budget.text.isNotEmpty &&
        description.text.isNotEmpty &&
        category != '') {
      try {
        var regBody = {
          "userId": userId,
          "location": location.text,
          "description": description.text,
          "quantity": quatity.text,
          "price": budget.text,
          "category": category
        };
        var response = await http.post(Uri.parse(createbid),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(regBody));
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status']) {
          Get.snackbar(
            "Success",
            "Your bid was successfully created!",
            icon: const Icon(Icons.check_box, color: Colors.green),
            snackPosition: SnackPosition.BOTTOM,
          );
          location.clear();
          quatity.clear();
          budget.clear();
          description.clear();
          Get.to(
            () => const ActiveBidsPage(),
          );
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
    } else {
      Get.snackbar(
        "Error",
        "Please check your data again.",
        icon: const Icon(Icons.warning, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getBid(userId) async {
    var regBody = {"userId": userId};
    var response = await http.post(Uri.parse(getbid),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody));
    var jsonResponse = jsonDecode(response.body);
    items = jsonResponse['success'];
    setState(() {});
  }
}
