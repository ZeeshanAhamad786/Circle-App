import 'package:circleapp/view/screens/athentications/verIfymobilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import '../../../custom_widget/custom-button.dart';
import '../../../custom_widget/custom_text_field.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 9.h,
              ),
              Center(
                  child: Image.asset(
                "assets/png/forgetScreen.png",
                height: 272.px,
                width: 272.px,
              )),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Welcome Back!",
                style: CustomTextStyle.mediumTextL,
              ),
              SizedBox(
                height: 0.8.h,
              ),
              Text(
                "Please enter the required details",
                style: CustomTextStyle.mediumTextS1,
              ),
              SizedBox(
                height: 4.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Email",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontFamily: "medium",
                        fontSize: 10.px)),
              ),
              SizedBox(
                height: 0.4.h,
              ),
              CustomTextField(
                hintText: "Litahan12@gmail.com",
                prefixIcon: SvgPicture.asset("assets/svg/email.svg"),
              ),
              SizedBox(
                height: 4.h,
              ),
              CustomMainButton(
                  buttonText: "Done",
                  buttonColor: CustomColor.mainColorYellow,
                  onPressed: () {
                    Get.to(() => VerifyMobileScreen());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
