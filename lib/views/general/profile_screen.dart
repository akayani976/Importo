import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:importo/utilities/user.dart';
import 'package:importo/views/authentication/log_in.dart';
import 'package:importo/views/general/bids_list.dart';
import 'package:importo/views/general/profile_settings.dart';
import 'package:importo/widgets/headings.dart';

import '../../utilities/colors.dart';
import '../../utilities/common_methods.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSwitched = false;
  bool isLoading = false;
  String mainHeading = 'Your Name';
  String supportingHeading = 'Manage your profile here';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              profilePictureCircle(),
              ScreenHeadings(
                mainHeadingText: mainHeading,
                supportingHeadingText: supportingHeading,
                topMargin: 120,
              ),
            ],
          ),
          const Divider(
            color: Colors.black54,
          ),
          profilePageOptions(
            'Edit Your Profile',
            'View and edit your profile',
            Icons.account_circle_outlined,
            270,
            onTap: () {
              Get.to(() => const ProfileSettingsPage());
            },
          ),
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(50),
              right: HelperMethods().getMyDynamicWidth(50),
              top: HelperMethods().getMyDynamicHeight(70),
            ),
            child: const Divider(
              color: Colors.black54,
            ),
          ),
          profilePageOptions(
            'Bid History',
            'View your active and previous\n bids here',
            Icons.history_sharp,
            180,
            onTap: () {
              Get.to(
                () => const BidsListPage(),
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(50),
              right: HelperMethods().getMyDynamicWidth(50),
              top: HelperMethods().getMyDynamicHeight(60),
            ),
            child: const Divider(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: HelperMethods().getMyDynamicHeight(120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Log Out?'),
                          content: const Text(
                              'Are you sure you want to logout of your Croshez session?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                MyUser.userId = '';
                                Get.offAll(
                                  () => const LogInPage(),
                                );
                              },
                              child: const Text('Yes'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Log out',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profilePageOptions(
    String header,
    String description,
    IconData icon,
    double lastIconLeftMargin, {
    Function? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        margin: EdgeInsets.only(
          top: HelperMethods().getMyDynamicHeight(100),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: HelperMethods().getMyDynamicWidth(50),
                    top: HelperMethods().getMyDynamicHeight(8),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors().secondaryThemeColor,
                    size: HelperMethods().getMyDynamicHeight(80),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: HelperMethods().getMyDynamicWidth(35),
                      ),
                      child: Text(
                        header,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: HelperMethods().getMyDynamicFontSize(18),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: HelperMethods().getMyDynamicHeight(30),
                        left: HelperMethods().getMyDynamicWidth(35),
                      ),
                      child: Text(
                        description,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: HelperMethods().getMyDynamicFontSize(16),
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: HelperMethods().getMyDynamicWidth(lastIconLeftMargin),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    textDirection: TextDirection.rtl,
                    color: Colors.black54,
                    size: HelperMethods().getMyDynamicHeight(35),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget userName() {
    return Container(
      margin: EdgeInsets.only(
        left: HelperMethods().getMyDynamicWidth(50),
        top: HelperMethods().getMyDynamicHeight(120),
      ),
      child: Text(
        'Your Name',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: HelperMethods().getMyDynamicFontSize(22),
        ),
      ),
    );
  }

  Widget profilePictureCircle() {
    return Container(
      height: HelperMethods().getMyDynamicHeight(250),
      width: HelperMethods().getMyDynamicWidth(250),
      margin: EdgeInsets.only(
        top: HelperMethods().getMyDynamicHeight(120),
        left: HelperMethods().getMyDynamicWidth(50),
      ),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            HelperMethods().getMyDynamicHeight(50),
          ),
        ),
        child: Image.asset(
          'assets/profile_avatar.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
