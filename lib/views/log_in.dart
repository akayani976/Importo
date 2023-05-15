import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/utilities/size_config.dart';
import 'package:importo/views/buyers_homepage.dart';
import 'package:importo/views/sign_up.dart';
import 'package:importo/widgets/buttons.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LogInPage extends StatefulWidget {
  @override
  LogInPageState createState() => LogInPageState();
  const LogInPage({super.key});
}

class LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };
      var response = await http.post(Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);
        //routing needs to be done
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyerHomePage(token: myToken)));
      } else {
        print('Something went wrong');
      }
    }
  }

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
                  child: const Image(image: AssetImage('assets/importo.png'))),
              Text(
                'Login to the Importo market!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    wordSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: HelperMethods().getMyDynamicFontSize(25),
                    color: const Color.fromARGB(255, 65, 193, 186)),
              ),
              Gap(HelperMethods().getMyDynamicHeight(250)),
              // i removed const keyword form every text field because it was giving error
              TextField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Enter your Email'),
              ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Create your password'),
              ), //add error msg errorText: _isNotValidate ? "Enter Proper Info" : null,
              Gap(HelperMethods().getMyDynamicHeight(100)),
              GestureDetector(
                onTap: () {
                  loginUser();
                },
                // onTap: () {
                // Get.to(() => const BuyerHomePage());
                //},
                child: Button(
                    height: HelperMethods().getMyDynamicHeight(195),
                    width: HelperMethods().getMyDynamicWidth(1080),
                    text: 'Start trading'),
              ),
              Gap(HelperMethods().getMyDynamicHeight(50)),
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignUpPage());
                },
                child: const Text(
                  'Not part of the Importo market? SignUp here!',
                  style: TextStyle(color: Color.fromARGB(255, 40, 157, 210)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
