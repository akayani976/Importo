/* 
This class contains methods which do not need any context and are used for more than once in app.
*/

import 'package:importo/utilities/size_config.dart';

abstract class HelperMethodsAbstract {
  /* converListIntoString is a method which is used to convert a String list
     (received from back-end) to a single string for using inside a Text widget.
     */
  // String converListIntoString(List<String> mStrList);
  // String converListIntoBulletString(List<String> mStrList);
  // dynamic getFourButtonIndexWithZero(int selectedIndex, int numberOfOptions);
  double getMyDynamicFontSize(double figmaFontSize);
  double getMyDynamicWidth(double figmaWidth);
  double getMyDynamicHeight(double figmaHeight);
  // dynamic getTappedFourButtonValueWithZero(
  //     int selectedIndex, int numberOfOptions);
  // String getmyFreeText(String mText, String mKey);
  // double getBottomMarginforBigScreens({bool isAppBarMargin});
}

class HelperMethods implements HelperMethodsAbstract {
  @override
  // String converListIntoString(List<String> mStrList) {
  //   String str = "";
  //   for (int i = 0; i < mStrList.length; i++) {
  //     if (i == 0) {
  //       str = mStrList[i];
  //     } else {
  //       str = str + "\n" + mStrList[i];
  //     }
  //   }
  //   if (str.length < 2) {
  //     str = "Nothing here for now!";
  //   }
  //   return str;
  // }

  // String converListIntoBulletString(List<String> mStrList) {
  //   String str = "";
  //   for (int i = 0; i < mStrList.length; i++) {
  //     if (i == 0) {
  //       if (mStrList[i].length > 0) {
  //         str = "• " + mStrList[i];
  //       }
  //     } else {
  //       str = str + "\n• " + mStrList[i];
  //     }
  //   }
  //   /* if (str.length < 2) {
  //     str = "Nothing here for now!";
  //   } */
  //   return str;
  // }

  // Future<bool> checkIsEmailAvailable(String email) async {
  //   final response = await http
  //       .get('${Strings.baseURL}/isavailable/email/$email', headers: {});

  //   if (response.statusCode == 200) {
  //     // If server returns an OK response, parse the JSON
  //     var res = json.decode(response.body);
  //     if (res["available"])
  //       return true;
  //     else
  //       return false;
  //   } else {
  //     // If that response was not OK, throw an error.
  //     return false;
  //   }
  // }

  // dynamic getFourButtonIndexWithZero(dynamic val, int numberOfOptions,
  //     {bool nullBoolean}) {
  //   int idx = 404;
  //   if (nullBoolean == true) {
  //     if (val == null || val == 'null') {
  //       return 0;
  //     }
  //     if (val == false || val == 0 || val == 'false') {
  //       return 1;
  //     }
  //     if (val == true || val == 1 || val == 2 || val == 'true') {
  //       return 2;
  //     }
  //   }
  //   if (val == null) {
  //     return val;
  //   }
  //   if (val != 404) {
  //     if (val is String) {
  //       val = int.parse(val);
  //     }
  //     if (numberOfOptions == 3) {
  //       // if (val >= 3) {
  //       //   idx = 5;
  //       // } else
  //       if (val >= 4) {
  //         idx = 2;
  //       } else if (val == 3 || val == 2) {
  //         idx = 1;
  //       } else if (val <= 1) {
  //         idx = 0;
  //       }
  //     } else {
  //       if (val >= 4) {
  //         idx = 3;
  //       } else if (val == 3) {
  //         idx = 2;
  //       } else if (val == 1) {
  //         idx = 1;
  //       } else if (val < 1) {
  //         idx = 0;
  //       }
  //     }
  //   }

  //   return idx;
  // }

  // dynamic getTappedFourButtonValueWithZero(
  //     int selectedIndex, int numberOfOptions,
  //     {bool nullBoolean}) {
  //   int val = 0;

  //   if (nullBoolean == true) {
  //     if (selectedIndex == 0) {
  //       return null;
  //     }
  //     if (selectedIndex == 1) {
  //       return 0;
  //     }
  //     if (selectedIndex == 3 || selectedIndex == 2) {
  //       return 1;
  //     }
  //   }

  //   if (selectedIndex == null) {
  //     return selectedIndex;
  //   }

  //   if (numberOfOptions == 3) {
  //     if (selectedIndex == 0) {
  //       val = 1;
  //     } else if (selectedIndex == 1) {
  //       val = 3;
  //     } else if (selectedIndex >= 2) {
  //       val = 5;
  //     }
  //     // else if (selectedIndex == 3 || selectedIndex == 4) {
  //     //   val = 5;
  //     // }
  //   } else {
  //     if (selectedIndex == 0) {
  //       val = 0;
  //     } else if (selectedIndex == 1) {
  //       val = 1;
  //     } else if (selectedIndex == 2) {
  //       val = 3;
  //     } else if (selectedIndex == 3 || selectedIndex == 4) {
  //       val = 5;
  //     }
  //   }

  //   return val;
  // }

  // String getmyFreeText(String mText, String mKey) {
  //   String s = "";
  //   if (mText != null) {
  //     var map = json.decode(mText);
  //     String txt = map[mKey] ?? "none";
  //     if (txt != "none") {
  //       s = txt;
  //     }
  //   }
  //   return s;
  // }

  @override
  // double getBottomMarginforBigScreens({bool isAppBarMargin}) {
  //   if (isAppBarMargin != null && isAppBarMargin) {
  //     double mMargin = 25;
  //     if (AppLayout.screenHeight > 805) {
  //       mMargin = 100;
  //     }
  //     return mMargin;
  //   } else {
  //     double mMargin = 60;

  //     if (AppLayout.screenHeight > 805) {
  //       mMargin = 150;
  //     }
  //     return mMargin;
  //   }
  // }

  @override
  double getMyDynamicFontSize(double figmaFontSize) {
    // 2.16 value based onfigma designs
    double calculatedValue = figmaFontSize / 2.1641025641;
    double returnSize = AppLayout.myBaseFont * calculatedValue;

    return returnSize;
  }

  @override
  double getMyDynamicHeight(double figmaHeight) {
    // 8.44 value based onfigma designs
    double calculatedValue = figmaHeight / 23.40;
    double returnSize = AppLayout.myBlockVertical * calculatedValue;

    return returnSize;
  }

  @override
  double getMyDynamicWidth(double figmaWidth) {
    // 3.90 value based onfigma designs
    double calculatedValue = figmaWidth / 10.80;
    double returnSize = AppLayout.myBlockHorizontal * calculatedValue;

    return returnSize;
  }

  // String getFormatedNumber(num value, {int numberTillDecimal = 0}) {
  //   String temp = value.toStringAsFixed(numberTillDecimal);
  //   // if(temp[temp.length-1] == '0'){
  //   //   temp = temp.substring(0,temp.length-2);
  //   // }

  //   return temp;
  // }

  // String myPrefixFinder(int dayNum) {
  //   if (dayNum >= 11 && dayNum <= 13) {
  //     return 'th';
  //   }

  //   switch (dayNum % 10) {
  //     case 1:
  //       return 'st';
  //     case 2:
  //       return 'nd';
  //     case 3:
  //       return 'rd';
  //     default:
  //       return 'th';
  //   }
  // }

  // String getNameInitials(String firstName, [String lastName]) {
  //   String name = " ";

  //   String fName = firstName;
  //   String lNAme = lastName;

  //   if (fName != null &&
  //       lNAme != null &&
  //       fName.isNotEmpty &&
  //       lNAme.isNotEmpty) {
  //     name = fName[0] + lNAme[0];
  //   }

  //   return name;
  // }

  // void sendAppleData(DateTime selectedDate, Store<AppState> store) async {
  //   if (Platform.isIOS) {
  //     print("send apple");
  //     final prefs = await SharedPreferences.getInstance();
  //     bool hasPermissions = prefs.getBool("apple_health_per") ?? false;

  //     Future.delayed(Duration(seconds: 5)).then((value) {
  //       if ((store.state.dashboardDataModel?.user?.isAppleConnected ?? false) &&
  //           hasPermissions) {
  //         AppleHealthKitHelper().fetchAndSendData(
  //             DateTime(selectedDate.year, selectedDate.month, selectedDate.day,
  //                 00, 00, 00),
  //             DateTime(selectedDate.year, selectedDate.month, selectedDate.day,
  //                 23, 59, 59));
  //       }
  //     });
  //   }
  // }

  // String getIntensityString(int intensity) {
  //   if (intensity > 7) {
  //     return 'High';
  //   } else if (intensity > 3) {
  //     return 'Med';
  //   } else {
  //     return 'Low';
  //   }
  // }
}
