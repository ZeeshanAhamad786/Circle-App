import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../custom_widget/customwidgets.dart';

class WinterTripPlanDetails extends StatelessWidget {
  const WinterTripPlanDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerticalSpace(6.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 2.h,
                  ),
                ),
                getHorizentalSpace(1.5.h),
                Text(
                  'Winter trip plan details',
                  style: CustomTextStyle.headingStyle,
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            getVerticalSpace(3.3.h),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: 'Title: ', style: CustomTextStyle.buttonText.copyWith(color: Colors.white, fontSize: 12.px)),
                TextSpan(text: 'Winter Trip Plan:', style: CustomTextStyle.buttonText.copyWith(color: Colors.white, fontSize: 12.px)),
              ]),
            ),
            getVerticalSpace(1.2.h),
            Text(
              '''Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.''',
              style: CustomTextStyle.hintText,
            ),
            getVerticalSpace(1.2.h),
            Text(
              'Images',
              style: CustomTextStyle.headingStyle.copyWith(color: Colors.white),
            ),
            getVerticalSpace(1.h),
            SizedBox(
              height: 8.h,
              width: MediaQuery.of(context).size.width - 2.3.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemExtent: 10.6.h,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 1.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.px),
                        color: CustomColor.textFieldColor,
                        image: const DecorationImage(image: AssetImage('assets/png/postimage.jpeg'), fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            getVerticalSpace(4.7.h),
            Text(
              'Added person',
              style: CustomTextStyle.headingStyle.copyWith(color: Colors.white),
            ),
            getVerticalSpace(1.h),
            SizedBox(
              height: 4.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemExtent: 5.h,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: .3.h),
                    decoration: BoxDecoration(border: Border.all(color: CustomColor.secondaryColor), shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: 10.h,
                      backgroundColor: CustomColor.mainColor,
                      backgroundImage: const AssetImage('assets/png/story.png'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
