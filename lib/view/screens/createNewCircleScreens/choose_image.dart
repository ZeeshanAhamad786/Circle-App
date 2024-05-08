import 'dart:io';

import 'package:circleapp/controller/paymentController.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../controller/utils/color/custom_color.dart';
import '../../../../custom_widget/custom-button.dart';
import 'createCircleScreen.dart';
class ChooseImage extends StatelessWidget {
  const ChooseImage({super.key});



  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController=Get.put(PaymentController());
    RxBool backButton = false.obs;
    RxBool nextButton = true.obs;
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Obx(()=>
          Column(children: [
            SizedBox(height: 11.h,),
            Center(child: Text("Select your picture",style: CustomTextStyle.mediumTextL,)),
            SizedBox(height: paymentController.pickedImage.value !=null?4.h: 14.h,),
            paymentController.pickedImage.value !=null?
            Container(
              height: 46.6.h,
              decoration: BoxDecoration(
                  color: CustomColor.textFieldColor,
                  borderRadius: BorderRadius.circular(
                    20.px,

                  ),

              ),   child: paymentController.pickedImage.value == null
                ? const Center(child: Text('No image selected'))
                : ClipRRect(  borderRadius: BorderRadius.circular(20.px),
                  child: Image.file(
                              File(paymentController.pickedImage.value!.path),
                              fit: BoxFit.cover,
                            ),
                ),
            ):
            Image.asset("assets/png/chooseImage.png"),
            SizedBox(height:6.h ,),
            paymentController.pickedImage.value !=null?   Obx(()=>
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
                        Get.back();
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
                        Get.to(const CreateCircle());
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
                )):  CustomMainButton(buttonText: "Choose Image",buttonColor: CustomColor.mainColorYellow,
                onPressed: (){
               paymentController. pickImage();
                }),
          ],),
        ),
      ),
    );
  }
}
