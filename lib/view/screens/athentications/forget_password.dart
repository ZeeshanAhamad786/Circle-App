import 'package:circleapp/controller/api/auth_apis.dart';
import 'package:circleapp/controller/auth_controller/forgotpassword_controller.dart';
import 'package:circleapp/view/custom_widget/custom-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import '../../custom_widget/custom_text_field.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  late ForgotPasswordController forgotPasswordController;
  late AuthApis authApis;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgotPasswordController = Get.put(ForgotPasswordController(context));
    authApis = AuthApis(context);
  }

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
                child: Text("Mobile Number", style: TextStyle(color: Colors.white.withOpacity(0.6), fontFamily: "medium", fontSize: 10.px)),
              ),
              SizedBox(
                height: 0.4.h,
              ),
              CustomTextField(
                phoneKeyboard: true,
                controller: forgotPasswordController.forgotPasswordTextController,
                hintText: "+00 123321 456",
                prefixIcon: SvgPicture.asset("assets/svg/Mobile.svg"),
              ),
              SizedBox(
                height: 4.h,
              ),
              Obx(() {
                return forgotPasswordController.isLoading.value
                    ? CircularProgressIndicator(
                        color: CustomColor.mainColorYellow,
                      )
                    : CustomButton(
                        buttonText: "Done",
                        buttonColor: CustomColor.mainColorYellow,
                        onPressed: () {
                          forgotPasswordController.forgotPasswordApi(forgotPasswordController.forgotPasswordTextController.text);
                          // Get.to(() => VerifyMobileScreen());
                        });
              })
            ],
          ),
        ),
      ),
    );
  }
}
