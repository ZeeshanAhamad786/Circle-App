import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/showImageScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../controller/utils/color/custom_color.dart';
import '../../../../custom_widget/custom-button.dart';
class ChooseImage extends StatelessWidget {
  const ChooseImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(children: [
          SizedBox(height: 11.h,),
          Center(child: Text("Select your picture",style: CustomTextStyle.mediumTextL,)),
          SizedBox(height: 14.h,),
          Image.asset("assets/png/chooseImage.png"),
          SizedBox(height:6.h ,),
          CustomMainButton(buttonText: "Choose Image",buttonColor: CustomColor.mainColorYellow,
              onPressed: (){
                Get.to(()=>ShowImage());
              }),
        ],),
      ),
    );
  }
}
