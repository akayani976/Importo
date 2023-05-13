import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/widgets/buttons.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config.dart';

import 'log_in.dart';
import 'selection_page.dart';
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
  TextEditingController roleontroller = TextEditingController();
  bool isNotVallidate = false;

  void registerUSer() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text
      };
      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse['status']);
      if (jsonResponse['status']) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LogInPage()));
      } else {
        print("SomeThing Went Wrong");
      }
    } else {
      setState(() {
        isNotVallidate = true;
      });
    }
  }

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
              TextField(
                controller: usernameController,
                decoration: InputDecoration(hintText: 'Enter username'),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Enter email'),
              ),
              Gap(HelperMethods().getMyDynamicHeight(30)),
              SizedBox(
                child: DropdownButton<String>(
                  // style: TextStyle(font: 10),
                  hint: const Text('Select a role'),
                  //this controller needs to be set
                  dropdownColor: const Color.fromARGB(255, 65, 193, 186),
                  items: <String>['Buyer', 'Seller', 'Transporter']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Create your password'),
              ),
              Gap(HelperMethods().getMyDynamicHeight(100)),
              GestureDetector(
                onTap: () => {
                  registerUSer()
                }, //backend function is called for post http request
                child: Button(
                    height: HelperMethods().getMyDynamicHeight(195),
                    width: HelperMethods().getMyDynamicWidth(1080),
                    text: 'Become a trader'),
              ),
              Gap(HelperMethods().getMyDynamicHeight(50)),
              GestureDetector(
                onTap: () {
                  Get.to(() => const LogInPage());
                },
                child: const Center(
                  child: Text(
                    'Already an Importo trader? Login here!',
                    style: TextStyle(color: Color.fromARGB(255, 40, 157, 210)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
