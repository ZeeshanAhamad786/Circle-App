import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import '../athentications/login_screen.dart';
import '../home_screen/plan_event_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:CustomColor.mainColorBackground,
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(height: 5.h),
            // Tab bar
            TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                  color: CustomColor.mainColorYellow,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: CustomTextStyle.mediumTextTab,
              unselectedLabelColor: CustomColor.mainColorOffWhite.withOpacity(0.5),
              dividerColor: CustomColor.mainColorOffWhite.withOpacity(0.5),
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
                  LoginScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
