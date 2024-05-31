import 'package:circleapp/controller/utils/app_colors.dart';
import 'package:circleapp/controller/utils/customTextStyle.dart';
import 'package:circleapp/view/addNewPlanScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../custom_widget/customwidgets.dart';

class Add_new_event extends StatelessWidget {
  const Add_new_event({super.key});

  @override
  Widget build(BuildContext context) {
    RxList<int> colorsList = <int>[
      0xffFFCC4D,
      0xffEF3B3B,
      0xffFF4DD8,
      0xff7B4DFF,
      0xff0BE9F8,
      0xff7BFF4D,
      0xff00B383,
      0xff735BF2,
      0xffFFCC4D,
      0xffBDA7FC,
      0xffEF3B3B,
      0xff0BE9F8,
      0xffFF4DD8,
      0xff7BFF4D
    ].obs;
    RxInt selectedColor = 0.obs;

    final TextEditingController eventNameController = TextEditingController();

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
                    'Add New Event',
                    style: CustomTextStyle.headingStyle,
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              getVerticalSpace(2.9.h),
              Text(
                'Event name*',
                style: CustomTextStyle.buttonText.copyWith(fontSize: 10.px),
              ),
              getVerticalSpace(.5.h),
              customTextFormField(
                eventNameController,
                'Hangout',
                isObsecure: false,
              ),
              getVerticalSpace(3.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.2.h, vertical: 1.h),
                  decoration: BoxDecoration(color: AppColors.textFieldColor, borderRadius: BorderRadius.circular(20.px)),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Assign color',
                              style: CustomTextStyle.buttonText,
                            ),
                            Icon(
                              Icons.keyboard_arrow_up,
                              size: 3.2.h,
                              color: Colors.white,
                            )
                          ],
                        ),
                        getVerticalSpace(2.h),
                        SizedBox(
                          height: 2.h,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: colorsList.length,
                            itemExtent: 23,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    selectedColor.value = colorsList[index];
                                  },
                                  child: CircleAvatar(
                                    radius: 2.h,
                                    backgroundColor: Color(colorsList[index]),
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              getVerticalSpace(5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.3.h),
                child: customButton(
                    onTap: () {
                      if (eventNameController.text.isNotEmpty) {
                        Get.to(
                            () => const AddNewPlan(
                                  title: 'event',
                                ),
                            arguments: [selectedColor.value, eventNameController.text]);
                      } else {
                        Get.snackbar('Sorry', 'EventName Should not be Empty',
                            backgroundColor: Colors.white.withOpacity(0.5), colorText: AppColors.mainColorBackground);
                      }
                    },
                    backgroundColor: AppColors.secondaryColor,
                    borderColor: AppColors.primaryColor,
                    title: 'Done',
                    titleColor: Colors.black,
                    height: 4.5.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
