import 'package:circleapp/controller/utils/app_colors.dart';
import 'package:circleapp/controller/utils/customTextStyle.dart';
import 'package:circleapp/view/addNewPlanScreen.dart';
import 'package:circleapp/view/screens/tripPlanScreens/winterTripPlanDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../models/explore-model.dart';
import '../custom_widget/customwidgets.dart';
import 'explore_section/share_group.dart';

class PlansDetails extends StatelessWidget {
  const PlansDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ExploreModel> data = [
      ExploreModel(
          birdOffer: "Imagine Dragon’s Concert",
          totalPrice: "\$2500",
          date: "1/2/2024",
          concertName: "Imagine Dragon’s Concert",
          discription:
          "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
          location: " 13th Street. 47 W 13th St, New York, NY 10011, USA. 20 Cooper Square.",
          interest: "Music",
          images: [
            "assets/png/png4.png",
            "assets/png/png3.png",
            "assets/png/png2.png",
            "assets/png/png1.png"
          ], offerFor: ''),
      ExploreModel(
          birdOffer: "Art Gallery",
          totalPrice: "\$2500",
          date: "1/2/2024",
          concertName: "Imagine Dragon’s Concert",
          discription:
          "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
          location: " 13th Street. 47 W 13th St, New York, NY 10011, USA. 20 Cooper Square.",
          interest: "Music",
          images: [
            "assets/png/png4.png",
            "assets/png/png3.png",
            "assets/png/png2.png",
            "assets/png/png1.png"
          ], offerFor: ''),
      ExploreModel(
          birdOffer: "Early Bird Offer",
          totalPrice: "\$2500",
          date: "1/2/2024",
          concertName: "Imagine Dragon’s Concert",
          discription:
          "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
          location: " 13th Street. 47 W 13th St, New York, NY 10011, USA. 20 Cooper Square.",
          interest: "Music",
          images: [
            "assets/png/png4.png",
            "assets/png/png3.png",
            "assets/png/png2.png",
            "assets/png/png1.png"
          ], offerFor: '')
    ];
    final List<String> imageUrls = [
      "assets/png/png4.png",
      "assets/png/png3.png",
      "assets/png/png2.png",
      "assets/png/png1.png"
    ];
    RxList<int> colorsList = <int>[0xff00B383, 0xffFFC491, 0xff0095FF].obs;
    RxList<String> eventsNameList = <String>['Meeting', 'Hangout', 'Trip Plan'].obs;
    return Scaffold(
      backgroundColor: AppColors.mainColorBackground,
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
                  'Plan details',
                  style: CustomTextStyle.headingStyle,
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const AddNewPlan(title: 'plansDetail'));
                    },
                    child: customTextButton2(bgColor: const Color(0xffFFC491), title: 'Add New Plan', btnTextColor: const Color(0xff323232)))
              ],
            ),
            getVerticalSpace(3.5.h),
            Text(
              'Events',
              style: CustomTextStyle.headingStyle,
            ),
            getVerticalSpace(.4.h),
            SizedBox(
              height: 3.h,
              width: MediaQuery.of(context).size.width - 2.3.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: .5.h),
                    margin: index == 0 ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: 1.h),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.px), color: AppColors.textFieldColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: .6.h,
                          backgroundColor: Color(colorsList[index]),
                        ),
                        getHorizentalSpace(.5.h),
                        Text(
                          eventsNameList[index],
                          style: CustomTextStyle.buttonText.copyWith(fontSize: 10.px, color: Color(colorsList[index])),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            getVerticalSpace(2.5.h),
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle onTap
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.2.h, vertical: 2.h),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.textFieldColor),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data[index].birdOffer,
                                  style: CustomTextStyle.mediumTextM14,
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  data[index].date,
                                  style: TextStyle(
                                      color:
                                      Colors.white.withOpacity(0.5),
                                      fontSize: 11.px,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "medium"),
                                ),
                              ],
                            ),
                            getVerticalSpace(.5.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                data[index].discription,
                                style: TextStyle(
                                    color:
                                    Colors.white.withOpacity(0.5),
                                    fontSize: 10.px,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "medium"),
                              ),
                            ),
                            getVerticalSpace(1.h),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/svg/Location.svg"),
                                getHorizentalSpace(1.w),
                                Expanded(
                                  child: Text(
                                    data[index].location,
                                    style:  TextStyle(
                                        color:
                                        Colors.white.withOpacity(0.5),
                                        fontSize: 8.px,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "medium"),
                                  ),
                                ),
                              ],
                            ),

                            getVerticalSpace(1.2.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Added members",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                              ),
                            ),
                            getVerticalSpace(1.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      height: 40,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: imageUrls.length,
                                          itemBuilder: (BuildContext, index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: Image.asset(
                                                imageUrls[index],
                                                width: 27,
                                                height: 27,
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    getHorizentalSpace(1.w),
                                    GestureDetector(onTap:() {
                                      Get.to(()=>const ShareGroupScreen());
                                    },
                                        child: SvgPicture.asset("assets/svg/shareButton.svg")),
                                    getHorizentalSpace(2.w),
                                    Container(
                                        height: 3.h,
                                        width: 22.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30), border: Border.all(color: AppColors.mainColorYellow)),
                                        child: Center(
                                            child: Text(
                                              "View Details",
                                              style: CustomTextStyle.mediumTextYellow,
                                            )))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
