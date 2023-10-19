import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:importo/utilities/colors.dart';
import 'package:importo/utilities/user.dart';
import 'package:importo/views/buyer/buyer_home_page.dart';
import 'package:importo/views/buyer/stats.dart';
import 'package:importo/views/general/profile_screen.dart';
import 'package:http/http.dart' as http;
import '../../utilities/common_methods.dart';
import '../../utilities/config.dart';
import '../../utilities/size_config.dart';

class BuyerPageBottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const BuyerPageBottomNavBar({
    Key? key,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<BuyerPageBottomNavBar> createState() => _BuyerPageBottomNavBarState();
}

class _BuyerPageBottomNavBarState extends State<BuyerPageBottomNavBar> {
  late int selectedIndex;

  @override
  void initState() {
    // getUserById(MyUser.userId);
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  static final List<Widget> widgetOptions = <Widget>[
    const BuyerHomePage(),
    const StatsPage(),
    const ProfilePage(),
  ];

  Future getUserById(String userId) async {
    try {
      var response = await http.get(
        Uri.parse(getId + userId),
        headers: {"Content-Type": "application/json"},
      );
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        return jsonResponse;
      } else {
        return 'error';
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void changeIndexOnTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLayout().init(context);
    return Scaffold(
      body: Center(
        child: widgetOptions[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: changeIndexOnTap,
        elevation: 10,
        useLegacyColorScheme: false,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
          fontSize: HelperMethods().getMyDynamicFontSize(12),
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1D1B20),
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: HelperMethods().getMyDynamicFontSize(12),
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1D1B20),
        ),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue[200],
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: HelperMethods().getMyDynamicHeight(70),
              width: HelperMethods().getMyDynamicWidth(120),
              margin: EdgeInsets.only(
                top: HelperMethods().getMyDynamicHeight(12),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    HelperMethods().getMyDynamicHeight(40),
                  ),
                  color: selectedIndex == 0
                      ? AppColors().secondaryThemeColor
                      : Colors.blue[200]),
              child: Icon(
                Icons.store_outlined,
                color:
                    selectedIndex == 0 ? Colors.white : const Color(0xFF5F5F5F),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Container(
                height: HelperMethods().getMyDynamicHeight(70),
                width: HelperMethods().getMyDynamicWidth(120),
                margin: EdgeInsets.only(
                  top: HelperMethods().getMyDynamicHeight(12),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      HelperMethods().getMyDynamicHeight(40),
                    ),
                    color: selectedIndex == 1
                        ? AppColors().secondaryThemeColor
                        : Colors.blue[200]),
                child: Icon(
                  Icons.bar_chart,
                  color: selectedIndex == 1
                      ? Colors.white
                      : const Color(0xFF5F5F5F),
                ),
              ),
              label: 'Stats'),
          BottomNavigationBarItem(
              icon: Container(
                height: HelperMethods().getMyDynamicHeight(70),
                width: HelperMethods().getMyDynamicWidth(120),
                margin: EdgeInsets.only(
                  top: HelperMethods().getMyDynamicHeight(30),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      HelperMethods().getMyDynamicHeight(40),
                    ),
                    color: selectedIndex == 2
                        ? AppColors().secondaryThemeColor
                        : Colors.blue[200]),
                child: Icon(
                  Icons.account_circle_outlined,
                  color: selectedIndex == 2
                      ? Colors.white
                      : const Color(0xFF5F5F5F),
                ),
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
