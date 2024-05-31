import 'package:circleapp/controller/api/auth_apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/getx_controllers/auth_controller/forgotpassword_controller.dart';
import '../../../controller/utils/app_colors.dart';
import '../../../controller/utils/customTextStyle.dart';
import '../../custom_widget/custom_loading_button.dart';
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
      backgroundColor: AppColors.mainColorBackground,
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
              CustomLoadingButton(
                buttonText: "Done",
                buttonColor: AppColors.mainColorYellow,
                onPressed: () {
                  forgotPasswordController.forgotPasswordApi(forgotPasswordController.forgotPasswordTextController.text);
                  // Get.to(() => VerifyMobileScreen());
                },
                loading: forgotPasswordController.isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
