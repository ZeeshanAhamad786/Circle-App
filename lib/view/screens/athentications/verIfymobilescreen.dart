import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import '../../../custom_widget/custom-button.dart';
class VerifyMobileScreen extends StatefulWidget {
  const VerifyMobileScreen({Key? key}) : super(key: key);

  @override
  State<VerifyMobileScreen> createState() => _VerifyMobileScreenState();
}

class _VerifyMobileScreenState extends State<VerifyMobileScreen> {
  final TextEditingController otpController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 3.h),
      child: SingleChildScrollView(
        child: Column(children: [

          SizedBox(
            height: 9.h,
          ),
          Center(
              child: Image.asset(
                "assets/png/verifyScreen.png",height: 272.px,width: 272.px,
              )),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Verify your mobile number",
            style: CustomTextStyle.mediumTextL,),
          SizedBox(
            height: 0.8.h,
          ),
          Text(
            "Please enter code we set you on +00 123\n 456 789, as text message",
            style: CustomTextStyle.mediumTextM,textAlign: TextAlign.center,),

          SizedBox(
            height: 5.h,
          ),
          PinCodeTextField(
            onCompleted: (v) {
              otpController.text = v;
            },
            length: 4,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            cursorColor: Colors.white,
            pinTheme: PinTheme(

              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 52,
              fieldWidth: 52,
              // activeFillColor: CustomColor.mainColor, // Background color
              // selectedFillColor: CustomColor.mainColor,
              // inactiveFillColor: CustomColor.mainColor,
              inactiveColor: CustomColor.mainColor, // Border color
              selectedColor: CustomColor.mainColor,
              activeColor: CustomColor.mainColor, // Color of filled text
              borderWidth: 0,
              activeBorderWidth: 0,
              disabledBorderWidth: 0,
              inactiveBorderWidth: 0,
              selectedBorderWidth: 0,
            ),
            animationDuration: Duration(milliseconds: 200),
            onChanged: (value) {
              log(value.toString());
            },
            beforeTextPaste: (text) {
              log("Allowing to paste $text");
              return true;
            },
            appContext: context, // Provide the context here
            textStyle: TextStyle(color: Colors.white), // Text color for both selected and inactive digits
          ),

          InkWell(
            onTap: () {
              // Get.to(()=>SignInScreen());
            },
            child: Align(alignment:Alignment.centerRight ,
              child: Text("Expires in 02:10",
                  style: CustomTextStyle.mediumTextM),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomMainButton(buttonText: "Done",buttonColor: CustomColor.mainColorYellow,
              onPressed: (){}),
          SizedBox(
            height: 1.3.h,
          ),
        Text("Resend",
            style: CustomTextStyle.mediumTextS),


        ],),
      ),
    ),);
  }
}
