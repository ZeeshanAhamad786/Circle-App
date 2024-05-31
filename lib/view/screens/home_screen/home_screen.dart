import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/app_colors.dart';
import '../../../controller/utils/customTextStyle.dart';
import '../home_screen/plan_event_screen.dart';
import 'itinerary_event_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff343434),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(height: 5.h),
            // Tab bar
            TabBar(
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                  color: AppColors.mainColorYellow,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: CustomTextStyle.mediumTextTab,
              unselectedLabelColor: AppColors.mainColorOffWhite.withOpacity(0.5),
              dividerColor: AppColors.mainColorOffWhite.withOpacity(0.5),
              tabs: [
                Tab(text: "Plans"),
                Tab(text: "Itineraries"),
              ],
            ),
            Expanded(
              // Content for tabs
              child: TabBarView(
                children: [
                  // Content for Tab 1
                  PlanEventScreen(),

                  // Content for Tab 2
                  ItineraryEventScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
