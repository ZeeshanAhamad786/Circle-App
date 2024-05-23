import 'dart:developer';
import 'package:circleapp/controller/auth_controller/signup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/auth_controller/resendotp_controller.dart';
import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import '../../../controller/auth_controller/verifyotp_controller.dart';
import '../../../custom_widget/custom-button.dart';
import 'login_screen.dart';

class VerifyMobileScreen extends StatefulWidget {
  VerifyMobileScreen({Key? key}) : super(key: key);

  @override
  State<VerifyMobileScreen> createState() => _VerifyMobileScreenState();
}

class _VerifyMobileScreenState extends State<VerifyMobileScreen> {
  late SignupController signupController;
  late ResendController resendController;
  late VerifyOTPController verifyOtpController;

  @override
  void initState() {
    super.initState();
    signupController = Get.put(SignupController(context));
    resendController = Get.put(ResendController(context));
    verifyOtpController = Get.put(VerifyOTPController(context));
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments;
    String phoneNumber = arguments['phoneNumber'];
    print('check pn: $phoneNumber');
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 9.h),
              Center(
                child: Image.asset(
                  "assets/png/verifyScreen.png",
                  height: 272.px,
                  width: 272.px,
                ),
              ),
              SizedBox(height: 5.h),
              Text("Verify your mobile number",
                  style: CustomTextStyle.mediumTextL),
              SizedBox(height: 0.8.h),
              Text(
                "Please enter the code we sent you on $phoneNumber as a text message",
                style: CustomTextStyle.mediumTextS1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.h),
              PinCodeTextField(
                onCompleted: (v) {
                  verifyOtpController.otpCodeTextController.text = v;
                },
                length: 6,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                cursorColor: Colors.white,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 52,
                  fieldWidth: 52,
                  inactiveColor: CustomColor.mainColor,
                  selectedColor: CustomColor.mainColor,
                  activeColor: CustomColor.mainColor,
                  borderWidth: 0,
                  activeBorderWidth: 0,
                  disabledBorderWidth: 0,
                  inactiveBorderWidth: 0,
                  selectedBorderWidth: 0,
                ),
                animationDuration: const Duration(milliseconds: 200),
                onChanged: (value) {
                  log(value.toString());
                },
                beforeTextPaste: (text) {
                  log("Allowing to paste $text");
                  return true;
                },
                appContext: context,
                textStyle: const TextStyle(color: Colors.white),
              ),
              InkWell(
                onTap: () {
                  // Get.to(()=>SignInScreen());
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("Expires in 02:10",
                      style: CustomTextStyle.mediumTextS1),
                ),
              ),
              SizedBox(height: 5.h),
              Obx(() {
                return verifyOtpController.isLoading.value
                    ? CircularProgressIndicator(
                        color: CustomColor.mainColorYellow,
                      )
                    : CustomMainButton(
                        buttonText: "Done",
                        buttonColor: CustomColor.mainColorYellow,
                        onPressed: () {
                          verifyOtpController.verifyOtpApi(phoneNumber,
                              verifyOtpController.otpCodeTextController.text);
                        },
                      );
              }),
              SizedBox(height: 1.3.h),
              GestureDetector(
                  onTap: () {
                    resendController.resendOtpApis(phoneNumber);
                  },
                  child: Text("Resend", style: CustomTextStyle.mediumTextS1)),
            ],
          ),
        ),
      ),
    );
  }
}
