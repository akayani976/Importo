import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/views/buyer/buyer_home_bottom_navbar.dart';
import 'package:importo/views/seller/seller_page_bottom_navbar.dart';
import 'package:importo/widgets/buttons.dart';
import 'dart:convert';
import '../../utilities/config.dart';
import 'kyc_page.dart';
import 'log_in.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String dropdownValue = 'Buyer';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  bool isNotVallidate = false;
  final _formKey = GlobalKey<FormState>();
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            left: HelperMethods().getMyDynamicWidth(30),
            right: HelperMethods().getMyDynamicWidth(30)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(HelperMethods().getMyDynamicHeight(150)),
              SizedBox(
                  height: HelperMethods().getMyDynamicHeight(800),
                  width: HelperMethods().getMyDynamicWidth(1080),
                  child: const Image(image: AssetImage('assets/importo.png'))),
              Text(
                'Register to trade with Importo!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: HelperMethods().getMyDynamicFontSize(25),
                    color: const Color.fromARGB(255, 65, 193, 186)),
              ),
              Gap(HelperMethods().getMyDynamicHeight(130)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username can not be empty';
                        }
                        return null;
                      },
                      controller: usernameController,
                      decoration:
                          const InputDecoration(hintText: 'Enter username'),
                    ),
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
                      decoration:
                          const InputDecoration(hintText: 'Enter email'),
                    ),
                    Gap(HelperMethods().getMyDynamicHeight(30)),
                    SizedBox(
                      child: DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a role';
                          }

                          return null;
                        },
                        // style: TextStyle(font: 10),
                        hint: const Text('Select a role'),
                        value: dropdownValue,

                        //this controller needs to be set
                        dropdownColor: const Color.fromARGB(255, 65, 193, 186),
                        items: <String>['Buyer', 'Seller', 'Transporter']
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          },
                        ).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can not be empty';
                        }
                        if (value.length < 6) {
                          return 'Password can not be less than 6 characters';
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: 'Create your password'),
                    ),
                  ],
                ),
              ),
              Gap(
                HelperMethods().getMyDynamicHeight(100),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   isTapped = true;
                  // });
                  // if (_formKey.currentState!.validate()) {
                  //   registerUSer();
                  // }
                  // setState(() {
                  //   isTapped = false;
                  // });
                  if (_formKey.currentState!.validate()) {
                    Get.off(() => const SellerPageBottomNavBar());
                  }
                }, //backend function is called for post http request
                child: Button(
                  height: 195,
                  width: 1080,
                  text: 'Become a trader',
                  isTapped: isTapped,
                ),
              ),
              Gap(HelperMethods().getMyDynamicHeight(50)),
              GestureDetector(
                onTap: () {
                  Get.off(
                    () => const LogInPage(),
                  );
                },
                child: const Center(
                  child: Text(
                    'Already an Importo trader? Login here!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 40, 157, 210),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getUserId() async {
    try {
      var response = await http.get(
        Uri.parse(getId),
        headers: {"Content-Type": "application/json"},
      );
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        return jsonResponse['_id'];
      } else {
        return 'error';
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void registerUSer() async {
    if (emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty &&
        usernameController.text.trim().isNotEmpty &&
        dropdownValue.isNotEmpty) {
      var regBody = {
        "email": emailController.text.trim(),
        "username": usernameController.text.trim(),
        "password": passwordController.text,
        "role": dropdownValue
      };
      try {
        print('regBody = $regBody');
        var response = await http.post(Uri.parse(registration),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(regBody));
        var jsonResponse = jsonDecode(response.body);
        print("jsonReponse = $jsonResponse");
        if (jsonResponse['status']) {
          // String userId = await getUserId();
          if (dropdownValue.toLowerCase() == 'buyer') {
            Get.off(
              () => const BuyerPageBottomNavBar(),
            );
          } else {
            Get.off(
              () => const KYCPage(),
            );
          }
        } else {
          Get.snackbar(
            "Registration Failed",
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
