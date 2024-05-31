import 'package:circleapp/controller/getx_controllers/paymentController.dart';
import 'package:circleapp/controller/utils/app_colors.dart';
import 'package:circleapp/controller/utils/customTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../custom_widget/customwidgets.dart';

class CreateItinerary extends StatelessWidget {
  const CreateItinerary({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt selectedColor = 0.obs;
    final PaymentController paymentController = Get.put(PaymentController());

    final TextEditingController itineraryNameController = TextEditingController();
    final TextEditingController aboutItineraryController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.3.h),
        child: SingleChildScrollView(
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
                    'Create Itinerary',
                    style: CustomTextStyle.headingStyle,
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              getVerticalSpace(2.9.h),
              Text(
                'Itinerary name*',
                style: CustomTextStyle.buttonText.copyWith(fontSize: 10.px),
              ),
              getVerticalSpace(.5.h),
              customTextFormField(
                itineraryNameController,
                'Breakfast in SOHO',
                isObsecure: false,
              ),
              getVerticalSpace(3.h),
              Text(
                'About itinerary.....',
                style: CustomTextStyle.buttonText.copyWith(fontSize: 10.px),
              ),
              getVerticalSpace(.5.h),
              customTextFormField(
                aboutItineraryController,
                borderRadius: BorderRadius.circular(20.px),
                maxLine: 3,
                'Type the note here...',
                isObsecure: false,
              ),
              getVerticalSpace(2.h),
              Obx(
                () => TextField(
                  onTap: () {
                    paymentController.pickedDate(context);
                  },
                  readOnly: true,
                  style: CustomTextStyle.hintText.copyWith(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 1.h,
                      ), // Adjust this value as needed
                      child: Icon(
                        Icons.date_range_rounded,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 1.h, top: 2.h), // Adjust this value as needed
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.px),
                    ),
                    fillColor: AppColors.textFieldColor,
                    filled: true,
                    hintStyle: CustomTextStyle.hintText,
                    hintText: '${paymentController.formatedDate}',
                    isCollapsed: true,
                  ),
                ),
              ),
              getVerticalSpace(2.h),
              Obx(
                () => TextField(
                  onTap: () {
                    paymentController.pickedTime(context);
                  },
                  readOnly: true,
                  style: CustomTextStyle.hintText.copyWith(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 1.h,
                      ), // Adjust this value as needed
                      child: Icon(
                        Icons.date_range_rounded,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 1.h, top: 2.h), // Adjust this value as needed
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.px),
                    ),
                    fillColor: AppColors.textFieldColor,
                    filled: true,
                    hintStyle: CustomTextStyle.hintText,
                    hintText: '${paymentController.formatedTime}',
                    isCollapsed: true,
                  ),
                ),
              ),
              getVerticalSpace(2.h),
              Text(
                'Add people',
                style: CustomTextStyle.headingStyle.copyWith(fontSize: 14.px),
              ),
              getVerticalSpace(1.h),
              Row(
                children: [
                  SizedBox(
                    height: 3.5.h,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemExtent: 4.h,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: .3.h),
                          decoration: BoxDecoration(border: Border.all(color: AppColors.secondaryColor), shape: BoxShape.circle),
                          child: CircleAvatar(
                            radius: 5.6.h,
                            backgroundColor: AppColors.mainColor,
                            backgroundImage: const AssetImage('assets/png/story.png'),
                          ),
                        );
                      },
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {},
                    child: customTextButton1(title: 'Add Member', horizentalPadding: 1.h, verticalPadding: .5.h, bgColor: Colors.transparent),
                  ),
                ],
              ),
              getVerticalSpace(2.4.h),
              getVerticalSpace(5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.3.h),
                child: customButton(
                    onTap: () {},
                    backgroundColor: AppColors.secondaryColor,
                    borderColor: AppColors.primaryColor,
                    title: 'Create Itinerary',
                    titleColor: Colors.black,
                    height: 4.5.h),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: .6.h,
                              backgroundColor: Colors.white,
                            ),
                            getHorizentalSpace(.5.h),
                            Text(
                              'Start the day with a visit to the',
                              style: CustomTextStyle.buttonText.copyWith(color: Colors.white),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              '09:00 AM',
                              style: CustomTextStyle.buttonText.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getHorizentalSpace(2.h),
                            Text(
                              'British Museum.',
                              style: CustomTextStyle.headingStyle.copyWith(color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                        getVerticalSpace(.6.h),
                        Divider(
                          color: AppColors.secondaryColor,
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
