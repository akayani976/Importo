import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/utilities/size_config.dart';
import 'package:importo/views/buyers_homepage.dart';
import 'package:importo/views/sign_up.dart';
import 'package:importo/widgets/buttons.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLayout().init(context);
    return Scaffold(
      body: Container(
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
            const TextField(
              decoration: InputDecoration(hintText: 'Enter your phone number'),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Create your password'),
            ),
            Gap(HelperMethods().getMyDynamicHeight(100)),
            GestureDetector(
              onTap: () {
                Get.to(() => const BuyerHomePage());
              },
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
    );
  }
}
