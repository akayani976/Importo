import 'package:flutter/material.dart';
import 'package:importo/utilities/colors.dart';
import 'package:importo/views/general/profile_screen.dart';
import 'package:importo/views/seller/sellers_homepage.dart';

import '../../utilities/common_methods.dart';
import '../../utilities/size_config.dart';

class SellerPageBottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const SellerPageBottomNavBar({
    Key? key,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<SellerPageBottomNavBar> createState() => _SellerPageBottomNavBarState();
}

class _SellerPageBottomNavBarState extends State<SellerPageBottomNavBar> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  static final List<Widget> widgetOptions = <Widget>[
    const SellerHomePage(),
    const ProfilePage(),
  ];

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
          // BottomNavigationBarItem(
          //     icon: Container(
          //       height: HelperMethods().getMyDynamicHeight(70),
          //       width: HelperMethods().getMyDynamicWidth(120),
          //       margin: EdgeInsets.only(
          //         top: HelperMethods().getMyDynamicHeight(12),
          //       ),
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(
          //             HelperMethods().getMyDynamicHeight(40),
          //           ),
          //           color: selectedIndex == 1
          //               ? AppColors().secondaryThemeColor
          //               : Colors.blue[200]),
          //       child: Icon(
          //         Icons.bar_chart,
          //         color: selectedIndex == 1
          //             ? Colors.white
          //             : const Color(0xFF5F5F5F),
          //       ),
          //     ),
          //     label: 'Stats'),
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
                    color: selectedIndex == 1
                        ? AppColors().secondaryThemeColor
                        : Colors.blue[200]),
                child: Icon(
                  Icons.account_circle_outlined,
                  color: selectedIndex == 1
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
