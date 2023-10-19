import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/utilities/size_config.dart';
import 'package:importo/utilities/user.dart';
import 'package:importo/views/buyer/buyer_home_bottom_navbar.dart';
import 'package:importo/views/seller/seller_page_bottom_navbar.dart';
import 'package:importo/views/authentication/sign_up.dart';
import 'package:importo/widgets/buttons.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/config.dart';
import 'dart:convert';

class LogInPage extends StatefulWidget {
  @override
  LogInPageState createState() => LogInPageState();
  const LogInPage({super.key});
}

class LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    AppLayout().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(30),
              right: HelperMethods().getMyDynamicWidth(30)),
          child: Column(
            children: [
              Gap(HelperMethods().getMyDynamicHeight(150)),
              SizedBox(
                height: HelperMethods().getMyDynamicHeight(800),
                width: HelperMethods().getMyDynamicWidth(1080),
                child: const Image(
                  image: AssetImage('assets/importo.png'),
                ),
              ),
              Text(
                'Login to the Importo market!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    wordSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: HelperMethods().getMyDynamicFontSize(25),
                    color: const Color.fromARGB(255, 65, 193, 186)),
              ),
              Gap(
                HelperMethods().getMyDynamicHeight(250),
              ),
              // i removed const keyword form every text field because it was giving error
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email can not be empty';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(hintText: 'Enter your Email'),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Length can not be less than 6';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: 'Enter your password'),
                    ), //add error msg errorText: _isNotValidate ? "Enter Proper Info" : null,
                  ],
                ),
              ),

              Gap(HelperMethods().getMyDynamicHeight(100)),
              GestureDetector(
                onTap: () async {
                  // isTapped = true;
                  // setState(() {});
                  // if (_formKey.currentState!.validate()) {
                  //   loginUser();
                  // }
                  if (_formKey.currentState!.validate()) {
                    Get.off(
                      () => const BuyerPageBottomNavBar(),
                    );
                  }
                  // isTapped = false;
                  // setState(() {});
                },
                child: Button(
                  height: 195,
                  width: 1080,
                  text: 'Start trading',
                  isTapped: isTapped,
                ),
              ),
              Gap(
                HelperMethods().getMyDynamicHeight(50),
              ),
              GestureDetector(
                onTap: () {
                  Get.off(
                    () => const SignUpPage(),
                  );
                },
                child: const Text(
                  'Not part of the Importo market? SignUp here!',
                  style: TextStyle(
                    color: Color.fromARGB(255, 40, 157, 210),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Future<String>

  Future<String> getUserRole() async {
    try {
      var response = await http.get(
        Uri.parse(getRole),
        headers: {"Content-Type": "application/json"},
      );
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        return jsonResponse['role'];
      } else {
        return 'error';
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void loginUser() async {
    if (emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      var reqBody = {
        "email": emailController.text.trim(),
        "password": passwordController.text
      };
      try {
        print('regBoy = $reqBody');
        var response = await http.post(Uri.parse(login),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(reqBody));
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status']) {
          MyUser.userId = jsonResponse['userId'];
          String userRole = await getUserRole();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('role', userRole);
          print('response = $jsonResponse');
          if (userRole.toLowerCase() == 'buyer') {
            Get.off(
              () => const BuyerPageBottomNavBar(),
            );
          } else if (userRole.toLowerCase() == 'seller') {
            Get.off(
              () => const SellerPageBottomNavBar(),
            );
          } else if (userRole.toLowerCase() == 'error') {
            Get.to(
              () => const SignUpPage(),
            );
          }
        } else {
          Get.snackbar(
            "Login Failed",
            "Something went wrong",
            icon: const Icon(Icons.warning, color: Colors.red),
            snackPosition: SnackPosition.BOTTOM,
          );
        }
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
}
