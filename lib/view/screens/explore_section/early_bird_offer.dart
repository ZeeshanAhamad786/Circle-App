import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/loopTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/app_colors.dart';
import '../../custom_widget/customwidgets.dart';

class EarlyBirdOffer extends StatefulWidget {
  const EarlyBirdOffer({Key? key}) : super(key: key);

  @override
  State<EarlyBirdOffer> createState() => _EarlyBirdOfferState();
}

class _EarlyBirdOfferState extends State<EarlyBirdOffer> {
  RxString largeImage = "assets/png/largeImage.png".obs;
  RxDouble imageHeight = 420.0.obs;
  RxDouble imageWidth = double.infinity.obs;
  List<String> images = [
    "assets/png/image1.png",
    "assets/png/image2.png",
    "assets/png/image3.png",
    "assets/png/image4.png",
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorBackground,
      appBar: AppBar(
        backgroundColor: AppColors.mainColorBackground,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 19.px,
                )),
            getHorizentalSpace(4.w),
            Text(
              "Early Bird Offer",
              style: CustomTextStyle.mediumTextExplore,
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(
            "assets/svg/shareIcon.svg",
          ),
          getHorizentalSpace(2.w),
          Container(
            height: 22.px,
            width: 20.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.mainColorYellow),
            child: Center(child: Text("Book")),
          ),
          SizedBox(
            height: 6.w,
            width: 6.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
            child: Obx(
          () => Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: imageHeight.value,
                  width: imageWidth.value,
                  child: Image.asset(
                    largeImage.value,
                    fit: BoxFit.cover,
                  )),
              getVerticalSpace(1.h),
              SizedBox(
                height: 11.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        largeImage.value = images[index];
                        imageHeight.value = 420.0;
                        imageWidth.value = double.infinity;
                      },
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                        child: Image.asset(
                          images[index],
                          height: 82,
                          width: 22.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              getVerticalSpace(1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Imagine Dragon’s Concert",
                    style: CustomTextStyle.mediumTextImageConcert,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => LoopTabBar());
                      },
                      child: SvgPicture.asset("assets/svg/save.svg"))
                ],
              ),
              getVerticalSpace(0.5.h),
              Text(
                """Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a\n mattie. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum""",
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
              ),
              getVerticalSpace(1.h),
              Row(
                children: [
                  Text(
                    "Offer for",
                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                  ),
                  getHorizentalSpace(0.5.w),
                  Text(
                    "5 People",
                    style: CustomTextStyle.mediumTextM,
                  ),
                ],
              ),
              getVerticalSpace(1.h),
              Row(
                children: [
                  Text(
                    "Interest",
                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                  ),
                  getHorizentalSpace(0.5.w),
                  Text(
                    "Music",
                    style: CustomTextStyle.mediumTextM,
                  ),
                ],
              ),
              getVerticalSpace(1.h),
              Row(
                children: [
                  Text(
                    "Total Price:",
                    style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                  ),
                  getHorizentalSpace(0.5.w),
                  Text(
                    "\$2500",
                    style: CustomTextStyle.mediumTextM,
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "10/07/2024",
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
                width: 2.h,
              )
            ],
          ),
        )),
      ),
    );
  }
}
