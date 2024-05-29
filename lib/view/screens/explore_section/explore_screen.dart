import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/view/screens/explore_section/early_bird_offer.dart';
import 'package:circleapp/view/screens/explore_section/share_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/explore-model.dart';
import '../../../controller/utils/color/custom_color.dart';
import '../../custom_widget/customwidgets.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  RxBool musicLover = false.obs;
  RxBool hiking = false.obs;
  RxBool dinner = false.obs;
  RxBool hangout = false.obs;
  final List<ExploreModel> data = [
    ExploreModel(
        birdOffer: "Early Bird Offer",
        totalPrice: "\$2500",
        date: "1/2/2024",
        concertName: "Imagine Dragon’s Concert",
        discription:
            "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
        offerFor: "5 people",
        interest: "Music",
        images: ["assets/png/png4.png", "assets/png/png3.png", "assets/png/png2.png", "assets/png/png1.png"]),
    ExploreModel(
        birdOffer: "Early Bird Offer",
        totalPrice: "\$2500",
        date: "1/2/2024",
        concertName: "Imagine Dragon’s Concert",
        discription:
            "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
        offerFor: "5 people",
        interest: "Music",
        images: ["assets/png/png4.png", "assets/png/png3.png", "assets/png/png2.png", "assets/png/png1.png"]),
    ExploreModel(
        birdOffer: "Early Bird Offer",
        totalPrice: "\$2500",
        date: "1/2/2024",
        concertName: "Imagine Dragon’s Concert",
        discription:
            "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
        offerFor: "5 people",
        interest: "Music",
        images: ["assets/png/png4.png", "assets/png/png3.png", "assets/png/png2.png", "assets/png/png1.png"])
  ];

  final List<String> imageUrls = ["assets/png/png4.png", "assets/png/png3.png", "assets/png/png2.png", "assets/png/png1.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          children: [
            getVerticalSpace(8.h),
            Center(
                child: Text(
              "Explore(Offers",
              style: CustomTextStyle.mediumTextExplore,
            )),
            getVerticalSpace(3.h),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(left: 2.5.h, top: 1.2.h),
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)), color: Color(0xff383838)),
                    child: Text("Music Lovers", style: CustomTextStyle.mediumTextLight),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: CustomColor.textFieldColor,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: SizedBox()),
                                Text(
                                  'Filter',
                                  style: CustomTextStyle.mediumTextM14,
                                ),
                                Expanded(child: SizedBox()),
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                            content: Padding(
                              padding: EdgeInsets.only(left: 4.5.h),
                              child: Text(
                                'Choose group to see offers',
                                style: CustomTextStyle.mediumTextS,
                              ),
                            ),
                            actions: <Widget>[
                              Obx(
                                () => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        musicLover.value = true;
                                        hiking.value = false;
                                        dinner.value = false;
                                        hangout.value = false;
                                      },
                                      child: Container(
                                        height: 5.h,
                                        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: CustomColor.mainColorBackground),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Music Lovers",
                                              style: CustomTextStyle.mediumTextM14,
                                            ),
                                            musicLover.value == true ? SvgPicture.asset("assets/svg/tick.svg") : SizedBox()
                                          ],
                                        ),
                                      ),
                                    ),
                                    getVerticalSpace(1.h),
                                    GestureDetector(
                                      onTap: () {
                                        musicLover.value = false;
                                        hiking.value = true;
                                        dinner.value = false;
                                        hangout.value = false;
                                      },
                                      child: Container(
                                        height: 5.h,
                                        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: CustomColor.mainColorBackground),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Hiking",
                                              style: CustomTextStyle.mediumTextM14,
                                            ),
                                            hiking.value == true ? SvgPicture.asset("assets/svg/tick.svg") : SizedBox()
                                          ],
                                        ),
                                      ),
                                    ),
                                    getVerticalSpace(1.h),
                                    GestureDetector(
                                      onTap: () {
                                        musicLover.value = false;
                                        hiking.value = false;
                                        dinner.value = true;
                                        hangout.value = false;
                                      },
                                      child: Container(
                                        height: 5.h,
                                        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: CustomColor.mainColorBackground),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Dinner",
                                              style: CustomTextStyle.mediumTextM14,
                                            ),
                                            dinner.value == true ? SvgPicture.asset("assets/svg/tick.svg") : SizedBox()
                                          ],
                                        ),
                                      ),
                                    ),
                                    getVerticalSpace(1.h),
                                    GestureDetector(
                                      onTap: () {
                                        musicLover.value = false;
                                        hiking.value = false;
                                        dinner.value = false;
                                        hangout.value = true;
                                      },
                                      child: Container(
                                        height: 5.h,
                                        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: CustomColor.mainColorBackground),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Hangout",
                                              style: CustomTextStyle.mediumTextM14,
                                            ),
                                            hangout.value == true ? SvgPicture.asset("assets/svg/tick.svg") : SizedBox()
                                          ],
                                        ),
                                      ),
                                    ),
                                    getVerticalSpace(2.h),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => ShareGroupScreen());
                                      },
                                      child: Container(
                                        height: 4.h,
                                        width: 36.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: CustomColor.mainColorYellow,
                                        ),
                                        child: Center(child: Text("Done")),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                          color: CustomColor.mainColorYellow),
                      child: Transform.scale(
                          scale: 0.6,
                          child: SvgPicture.asset(
                            "assets/svg/filter.svg",
                            alignment: Alignment.center,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => EarlyBirdOffer());
                },
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(horizontal: 2.2.h, vertical: 2.h),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: CustomColor.textFieldColor),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data[index].birdOffer,
                                  style: CustomTextStyle.mediumTextM14,
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  "Total Price:",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                ),
                                Text(
                                  data[index].totalPrice,
                                  style: CustomTextStyle.mediumTextM,
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                data[index].date,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  data[index].concertName,
                                  style: CustomTextStyle.mediumMixLightWhite,
                                )),
                            getVerticalSpace(.3.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                data[index].discription,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7), fontSize: 10.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                              ),
                            ),
                            getVerticalSpace(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Offer for:",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                ),
                                getHorizentalSpace(1.w),
                                Text(
                                  data[index].offerFor,
                                  style: CustomTextStyle.mediumTextM,
                                ),
                              ],
                            ),
                            getVerticalSpace(1.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Interests:",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                ),
                                getHorizentalSpace(1.w),
                                Text(
                                  data[index].interest,
                                  style: CustomTextStyle.mediumTextM,
                                ),
                              ],
                            ),
                            getVerticalSpace(1.2.h),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "images",
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
                                    SvgPicture.asset("assets/svg/shareButton.svg"),
                                    getHorizentalSpace(1.w),
                                    Container(
                                        height: 3.h,
                                        width: 22.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30), border: Border.all(color: CustomColor.mainColorYellow)),
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
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
