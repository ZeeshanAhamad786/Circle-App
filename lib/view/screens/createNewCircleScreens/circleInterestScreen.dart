import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'addMembersScreen.dart';

class CircleInterest extends StatelessWidget {
  const CircleInterest({super.key});

  @override
  Widget build(BuildContext context) {
    RxList<String> circleName = <String>[
      'Photography',
      'Shopping',
      'Music',
      'Movies',
      'Fitness',
      'Travelling',
      'Sports',
      'Video Games',
      'Night Out',
      'Art'
    ].obs;
    RxList<int>selectionList=<int>[0].obs;
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: Column(
        children: [
          getVerticalSpace(6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.h),
            child: Row(
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
                  'Circle interests',
                  style: CustomTextStyle.headingStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerticalSpace(1.h),
                Text(
                  '''share what your group is intreasted in and activites you participate in to recive exclusive offers for your circle!''',
                  style: CustomTextStyle.hintText
                      .copyWith(color: const Color(0xffF8F8F8)),
                ),
                getVerticalSpace(3.h),
                GridView.builder(
                  itemCount: circleName.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.h,
                      mainAxisSpacing: 1.4.h,
                      childAspectRatio: 4),
                  itemBuilder: (context, index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          if(selectionList.contains(index)){
                            selectionList.remove(index);
                          }else{
                            selectionList.add(index);
                          }

                        },
                        child: customRadioButton(

                            title: circleName[index],
                            borderColor: selectionList.contains(index)
                                ? CustomColor.textFieldColor
                                : CustomColor.secondaryColor,
                            assetsImage: selectionList.contains(index)
                                ? SvgPicture.asset('assets/svg/selected.svg')
                                : SvgPicture.asset(
                                    'assets/svg/unselected.svg')),
                      ),
                    );
                  },
                ),
                getVerticalSpace(4.7.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.2.h),
                  child: customButton(
                      onTap: () {
                        Get.to(()=>const AddMembers());
                      },
                      backgroundColor: CustomColor.secondaryColor,
                      borderColor: CustomColor.primaryColor,
                      title: 'Continue',
                      titleColor: Colors.black,
                      height: 4.5.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
