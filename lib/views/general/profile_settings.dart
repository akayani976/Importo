import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/common_methods.dart';
import 'package:importo/widgets/buttons.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  String userEmail = 'email@email.com';
  TextEditingController nameController =
      TextEditingController(text: 'Your Name');
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(
            HelperMethods().getMyDynamicHeight(140),
          ),
          backArrowIcon(),
          Gap(
            HelperMethods().getMyDynamicHeight(120),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/profile_avatar.png'),
            ],
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userEmail,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: HelperMethods().getMyDynamicFontSize(15),
                ),
              ),
            ],
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(150),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: HelperMethods().getMyDynamicWidth(50),
            ),
            child: TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(1080),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isTapped = true;
                    });
                    setState(() {
                      isTapped = false;
                    });
                  },
                  child: Button(
                    height: 195,
                    width: 980,
                    text: 'Save Changes',
                    isTapped: isTapped,
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget backArrowIcon() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: EdgeInsets.only(
          left: HelperMethods().getMyDynamicWidth(50),
        ),
        child: const Icon(IconData(0xe092,
            fontFamily: 'MaterialIcons', matchTextDirection: true)),
      ),
    );
  }
}
