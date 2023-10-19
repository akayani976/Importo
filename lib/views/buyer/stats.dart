import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:importo/utilities/colors.dart';
import 'package:importo/widgets/headings.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../utilities/common_methods.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int totalBids = 0;
  int successfullBids = 0;
  int pendingBids = 0;
  double successRate = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenHeadings(
            mainHeadingText: 'View Your Statistics',
            supportingHeadingText:
                'Track your bidding statistics to decide how to improve sales',
            topMargin: 120,
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(50),
          ),
          const Divider(
            color: Colors.black54,
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gap(
                HelperMethods().getMyDynamicWidth(50),
              ),
              Column(
                children: [
                  Text(
                    'Total bids:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: HelperMethods().getMyDynamicFontSize(15),
                    ),
                  ),
                  Gap(
                    HelperMethods().getMyDynamicHeight(50),
                  ),
                  Text(
                    '$totalBids',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: HelperMethods().getMyDynamicFontSize(15),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Successfull bids:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: HelperMethods().getMyDynamicFontSize(15),
                    ),
                  ),
                  Gap(
                    HelperMethods().getMyDynamicHeight(50),
                  ),
                  Text(
                    '$successfullBids',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: HelperMethods().getMyDynamicFontSize(15),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Pending bids:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: HelperMethods().getMyDynamicFontSize(15),
                    ),
                  ),
                  Gap(
                    HelperMethods().getMyDynamicHeight(50),
                  ),
                  Text(
                    '$pendingBids',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: HelperMethods().getMyDynamicFontSize(15),
                    ),
                  ),
                ],
              ),
              Gap(
                HelperMethods().getMyDynamicWidth(50),
              ),
            ],
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(80),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Success Rate',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: HelperMethods().getMyDynamicFontSize(16),
                ),
              ),
            ],
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(120),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: HelperMethods().getMyDynamicHeight(300),
                lineWidth: HelperMethods().getMyDynamicWidth(30),
                progressColor: AppColors().secondaryThemeColor,
                percent: 0.5,
                center: Text('$successRate%'),
              ),
            ],
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(120),
          ),
          Container(
            margin: EdgeInsets.only(
              left: HelperMethods().getMyDynamicWidth(50),
            ),
            child: Text(
              'User Ratings',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: HelperMethods().getMyDynamicFontSize(16),
              ),
            ),
          ),
          Gap(
            HelperMethods().getMyDynamicHeight(80),
          ),
          RatingBar.builder(
            ignoreGestures: true,
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(
              horizontal: HelperMethods().getMyDynamicWidth(40),
            ),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          )
        ],
      ),
    );
  }
}
