import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/utilities/size_config.dart';
import 'package:importo/views/bids_list.dart';
import 'package:importo/views/config.dart';
import 'package:importo/widgets/buttons.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../utilities/user.dart';
import 'log_in.dart';

class BuyerHomePage extends StatefulWidget {
  const BuyerHomePage({super.key});

  @override
  State<BuyerHomePage> createState() => _BuyerHomePageState();
}

class _BuyerHomePageState extends State<BuyerHomePage> {
  // late String userId;
  /// This userId is hard coded for now. Should be the Id of the user which is signed in
  String userId = MyUser.USERID;

  TextEditingController location = TextEditingController();
  TextEditingController quatity = TextEditingController();
  TextEditingController budget = TextEditingController();
  TextEditingController description = TextEditingController();
  String category = 'Cotton Yarn';

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
    AppLayout().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 40, 157, 210),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                child: Icon(
                  Icons.person_rounded,
                ),
              ),
              ListTile(
                title: const Text('Your Bids'),
                contentPadding: EdgeInsets.only(
                    left: HelperMethods().getMyDynamicWidth(360)),
                onTap: () {
                  Get.to(() => const BidsListPage());
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: HelperMethods().getMyDynamicHeight(499),
                width: HelperMethods().getMyDynamicWidth(1080),
                child: const Image(image: AssetImage('assets/importo.png')),
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
                              HelperMethods().getMyDynamicHeight(15)),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 40, 157, 210),
                              border: Border.all(
                                  color: category == 'Cotton Yarn'
                                      ? Colors.amberAccent
                                      : Colors.black,
                                  width: 5),
                              borderRadius: BorderRadius.circular(
                                  HelperMethods().getMyDynamicHeight(50))),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    category = 'Cotton Yarn';
                                  });
                                },
                                child: Container(
                                  height:
                                      HelperMethods().getMyDynamicHeight(120),
                                  width: HelperMethods().getMyDynamicWidth(125),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          HelperMethods()
                                              .getMyDynamicHeight(30)),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/cotton_yarn.jpg'),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Gap(HelperMethods().getMyDynamicHeight(20)),
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
                              color: const Color.fromARGB(255, 40, 157, 210),
                              border: Border.all(
                                  color: category == 'Thread'
                                      ? Colors.amberAccent
                                      : Colors.black,
                                  width: 5),
                              borderRadius: BorderRadius.circular(
                                  HelperMethods().getMyDynamicHeight(50))),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    category = 'Thread';
                                  });
                                },
                                child: Container(
                                  height:
                                      HelperMethods().getMyDynamicHeight(120),
                                  width: HelperMethods().getMyDynamicWidth(125),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          HelperMethods()
                                              .getMyDynamicHeight(30)),
                                      image: const DecorationImage(
                                          image:
                                              AssetImage('assets/thread.jpg'),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Gap(HelperMethods().getMyDynamicHeight(20)),
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
                              HelperMethods().getMyDynamicHeight(15)),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 40, 157, 210),
                              border: Border.all(
                                  color: category == 'Finished Products'
                                      ? Colors.amberAccent
                                      : Colors.black,
                                  width: 5),
                              borderRadius: BorderRadius.circular(
                                  HelperMethods().getMyDynamicHeight(50))),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                category = 'Finished Products';
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      HelperMethods().getMyDynamicHeight(120),
                                  width: HelperMethods().getMyDynamicWidth(125),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          HelperMethods()
                                              .getMyDynamicHeight(30)),
                                      image: const DecorationImage(
                                          image: AssetImage('assets/shirt.jpg'),
                                          fit: BoxFit.fill)),
                                ),
                                Gap(HelperMethods().getMyDynamicHeight(20)),
                                Text(
                                  'Finished Products',
                                  style: TextStyle(
                                      fontSize: HelperMethods()
                                          .getMyDynamicHeight(20),
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(HelperMethods().getMyDynamicHeight(30)),
                    TextField(
                      controller: location,
                      decoration: const InputDecoration(
                        hintText: 'What is your delivery location?',
                      ),
                    ),
                    Gap(HelperMethods().getMyDynamicHeight(30)),
                    TextField(
                      controller: quatity,
                      decoration: const InputDecoration(
                        hintText: 'What is the quantity you require?',
                      ),
                    ),
                    Gap(HelperMethods().getMyDynamicHeight(30)),
                    TextField(
                      controller: budget,
                      decoration: const InputDecoration(
                        hintText: 'What is your preferred budget?',
                      ),
                    ),
                    Gap(HelperMethods().getMyDynamicHeight(30)),
                    TextField(
                      controller: description,
                      maxLines: 5,
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Add a description...',
                      ),
                    ),
                    Gap(HelperMethods().getMyDynamicHeight(40)),
                    GestureDetector(
                      onTap: () {
                        createBid();
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: HelperMethods().getMyDynamicHeight(40)),
                        child: Button(
                            height: HelperMethods().getMyDynamicHeight(195),
                            width: HelperMethods().getMyDynamicWidth(1080),
                            text: 'Create Bid'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void createBid() async {
    if (location.text.isNotEmpty &&
        quatity.text.isNotEmpty &&
        budget.text.isNotEmpty &&
        description.text.isNotEmpty &&
        category != '') {
      print('Creating Bid');
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
        print(jsonResponse['status']);
        if (jsonResponse['status']) {
          print('bid created');
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
          // Navigator.pop(context);
          // getBid(userId);
        } else {
          print("SomeThing Went Wrong");
        }
      } catch (e) {
        print(e);
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
