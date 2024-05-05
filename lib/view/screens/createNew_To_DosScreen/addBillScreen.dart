import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddBills extends StatelessWidget {
  const AddBills({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleTextController = TextEditingController();
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
                    'Add Bill',
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
                  getVerticalSpace(3.h),
                  Text(
                    'Title',
                    style:
                    CustomTextStyle.smallText.copyWith(color: Colors.white),
                  ),
                  getVerticalSpace(.4.h),
                  customTextFormField(titleTextController, 'Winter trip Plan',
                      isObsecure: false),
                  getVerticalSpace(3.h),
                  Text(
                    'Total Bill',
                    style:
                    CustomTextStyle.smallText.copyWith(color: Colors.white),
                  ),
                  getVerticalSpace(.4.h),
                  customTextFormField(titleTextController,
                      '2500\$',
                      isObsecure: false,

                     ),
                  getVerticalSpace(3.h),
                  Text('Upload bill receipt', style: CustomTextStyle.headingStyle),
                  getVerticalSpace(.6.h),
                  Text('you can add multiple bill receipt.',
                      style: CustomTextStyle.hintText),
                  getVerticalSpace(1.h),
                  Image.asset("assets/png/chooseImage.png"),
                  getVerticalSpace(8.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.5.h),
                    child: customButton(
                        onTap: () {
                          showCustomDialog(context);
                        },
                        backgroundColor: CustomColor.secondaryColor,
                        borderColor: CustomColor.primaryColor,
                        title: 'Done',
                        titleColor: Colors.black,
                        height: 4.5.h),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

void showCustomDialog(BuildContext context) {
  final  RxBool backButton = false.obs;
  final  RxBool nextButton = true.obs;
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Material(color: Colors.transparent,
          child: Container(margin: EdgeInsets.symmetric(horizontal: 2.3.h),
            padding: EdgeInsets.symmetric(horizontal: 1.9.h, vertical: 1.3.h),
            height: 35.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.px),
                color: CustomColor.textFieldColor),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(onTap: (){
                      Get.back();

                    },
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 2.5.h,
                      ),
                    )
                  ],
                ),
                getVerticalSpace(2.h),
                Row(
                  children: [
                    Text(
                      'Bill Details',
                      style: CustomTextStyle.headingStyle,
                    ),
                    const Expanded(child: SizedBox()),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Total Bill: ',
                              style: CustomTextStyle.smallText.copyWith(
                                  color: const Color(0xffFFFFFF).withOpacity(0.48))),
                          TextSpan(text: '\$2500', style: CustomTextStyle.smallText),
                        ])),
                  ],
                ),
                getVerticalSpace(1.3.h),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Title: ',
                          style: CustomTextStyle.smallText.copyWith(color:  const Color(0xffDADADA))),
                      TextSpan(
                          text: 'Dinner Plan',
                          style: CustomTextStyle.smallText
                              .copyWith(color: const Color(0xffDADADA))),
                    ])),

                getVerticalSpace(1.3.h),
                Text('Bill receipts',style: CustomTextStyle.hintText.copyWith(color: const Color(0xffFFFFFF).withOpacity(0.69),)
                ),
                getVerticalSpace(1.3.h),
                SizedBox(
                  height: 4.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemExtent: 5.h,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: .3.h),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.px),
                              image: const DecorationImage(image: AssetImage('assets/png/image.png'))
                          ),

                        ),
                      );
                    },
                  ),
                ),
                getVerticalSpace(4.1.h),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [getHorizentalSpace(4.h),
                    Expanded(
                      child: customButton(onTap: (){
                        if(backButton.value==false){
                          backButton.value=true;
                          nextButton.value=false;
                        }else{
                          backButton.value=false;
                          nextButton.value=true;
                        }
                        Get.back();
                      },
                          backgroundColor:backButton.value==true?CustomColor.secondaryColor: CustomColor.primaryColor,
                          borderColor: backButton.value==true?CustomColor.primaryColor:CustomColor.secondaryColor,
                          title: 'Back',
                          titleColor :backButton.value==true? Colors.black:Colors.white,
                          width: 12.h,
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
                      },
                          backgroundColor:nextButton.value==true?CustomColor.secondaryColor: CustomColor.primaryColor,
                          borderColor: nextButton.value==true? CustomColor.primaryColor:CustomColor.secondaryColor,
                          title: 'Done',
                          titleColor:nextButton.value==true? Colors.black:Colors.white,
                          width: 12.h,
                          height: 4.5.h),
                    ),
                    getHorizentalSpace(4.h)
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
