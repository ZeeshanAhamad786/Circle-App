import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'circleInterestScreen.dart';

class CreateCircle extends StatelessWidget {
  const CreateCircle({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt selectedIndex = 0.obs;
    RxBool backButton = false.obs;
    RxBool nextButton = true.obs;
    RxList<String> circleName =
        <String>['Friend', 'Family', 'Organization', 'Mix'].obs;
    final TextEditingController circleNameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        title: Text(
          'Create Circle',
          style: CustomTextStyle.headingStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Circle name',
              style: CustomTextStyle.smallText,
            ),
            getVerticalSpace(.8.h),
            customTextFormField(
              circleNameController,
              'Hiking Plan',
              isObsecure: false,
            ),
            getVerticalSpace(1.h),
            Text(
              'Description',
              style: CustomTextStyle.smallText,
            ),
            getVerticalSpace(.8.h),
            customTextFormField(descriptionController,
                'Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum a..',
                isObsecure: false,
                maxLine: 5,
                borderRadius: BorderRadius.circular(30.px)),
            getVerticalSpace(2.5.h),
            Text(
              'Type of circle',
              style: CustomTextStyle.headingStyle,
            ),
            getVerticalSpace(.6.h),
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.h,
                  mainAxisSpacing: 1.4.h,
                  childAspectRatio: 4),
              itemBuilder: (context, index) {
                return Obx(
                  () =>GestureDetector(onTap: (){
                    selectedIndex.value=index;
                  },
                    child: customRadioButton(
                      title: circleName[index],
                      borderColor: selectedIndex.value==index?CustomColor.textFieldColor:CustomColor.secondaryColor,
                      assetsImage:selectedIndex.value==index?
                      SvgPicture.asset('assets/svg/selected.svg'):SvgPicture.asset('assets/svg/unselected.svg')
                    ),
                  ),
                );
              },
            ),
            getVerticalSpace(6.h),
        Obx(()=>
             Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [getHorizentalSpace(3.h),
                  Expanded(
                    child: customButton(onTap: (){
                      if(backButton.value==false){
                        backButton.value=true;
                        nextButton.value=false;
                      }else{
                        backButton.value=false;
                        nextButton.value=true;
                      }
                    },
                      backgroundColor:backButton.value==true?CustomColor.secondaryColor: CustomColor.primaryColor,
                      borderColor: backButton.value==true?CustomColor.primaryColor:CustomColor.secondaryColor,
                      title: 'Back',
                        titleColor :backButton.value==true? Colors.black:Colors.white,
                        width: 16.2.h,
                      height: 4.5.h),
                  ),getHorizentalSpace(1.h),

                     Expanded(
                      child: customButton(onTap: (){
                        if(nextButton.value==false){
                          nextButton.value=true;
                          backButton.value=false;
                        }else{
                          nextButton.value=false;
                          backButton.value=true;

                        }
                        Get.to(const CircleInterest());
                      },
                          backgroundColor:nextButton.value==true?CustomColor.secondaryColor: CustomColor.primaryColor,
                          borderColor: nextButton.value==true? CustomColor.primaryColor:CustomColor.secondaryColor,
                          title: 'Next',
                          titleColor:nextButton.value==true? Colors.black:Colors.white,
                          width: 16.2.h,
                          height: 4.5.h),
                    ),
                  getHorizentalSpace(3.h)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
