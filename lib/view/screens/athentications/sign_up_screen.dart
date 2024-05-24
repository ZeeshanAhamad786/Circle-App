import 'package:circleapp/controller/auth_controller/signup_controller.dart';
import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/custom_text_field.dart';
import 'package:circleapp/view/screens/athentications/verIfymobilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/validations/validation.dart';
import '../../../custom_widget/custom-button.dart';
import '../../../custom_widget/customwidgets.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignupController _signupController;

  @override
  void initState() {
    super.initState();
    _signupController = Get.put(SignupController(context));
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
              SizedBox(height: 9.h),
              Center(
                child: Image.asset(
                  "assets/png/loginScreen.png",
                  height: 272.px,
                  width: 272.px,
                ),
              ),
              SizedBox(height: 5.h),
              Text("Create Account", style: CustomTextStyle.mediumTextL),
              SizedBox(height: 0.8.h),
              Text(
                "Please enter the required details",
                style: CustomTextStyle.mediumTextS1,
              ),
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: "medium",
                    fontSize: 10.px,
                  ),
                ),
              ),
              SizedBox(height: 0.4.h),
              CustomTextField(
                controller: _signupController.userNameTextController,
                hintText: "Lita han",
                prefixIcon: SvgPicture.asset("assets/svg/profile.svg"),
              ),
              SizedBox(height: 2.5.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: "medium",
                    fontSize: 10.px,
                  ),
                ),
              ),
              SizedBox(height: 0.4.h),
              CustomTextField(
                controller: _signupController.emailTextController,
                hintText: "Litahan12@gmail.com",
                prefixIcon: SvgPicture.asset("assets/svg/email.svg"),
              ),
              SizedBox(height: 2.5.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mobile Number",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontFamily: "medium",
                    fontSize: 10.px,
                  ),
                ),
              ),
              SizedBox(height: 0.4.h),
              CustomTextField(
                controller: _signupController.phoneNumberController,
                phoneKeyboard: true,
                hintText: "+00 123321 456",
                prefixIcon: SvgPicture.asset("assets/svg/Mobile.svg"),
              ),
              SizedBox(height: 2.5.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 10.px,
                    fontFamily: "medium",
                  ),
                ),
              ),
              SizedBox(height: 0.4.h),
              CustomTextField(
                controller: _signupController.passwordTextController,
                hintText: "**********",
                prefixIcon: SvgPicture.asset("assets/svg/lock.svg"),
                suffixIcon: SvgPicture.asset("assets/svg/closeEye.svg"),
              ),
              SizedBox(height: 4.h),
              Obx(() {
                return _signupController.isLoading.value
                    ? CircularProgressIndicator(
                        color: CustomColor.mainColorYellow,
                      )
                    : CustomMainButton(
                        buttonText: "Sign Up",
                        buttonColor: CustomColor.mainColorYellow,
                        onPressed: () {
                          if (Validations.handleSingUpScreenError(
                            userNameTextController:
                                _signupController.userNameTextController,
                            emailTextController:
                                _signupController.emailTextController,
                            passwordTextController:
                                _signupController.passwordTextController,
                            mobileNumberTextController:
                                _signupController.phoneNumberController,
                          ).isNotEmpty) {
                            customScaffoldMessenger(
                              context,
                              Validations.handleSingUpScreenError(
                                userNameTextController:
                                    _signupController.userNameTextController,
                                emailTextController:
                                    _signupController.emailTextController,
                                passwordTextController:
                                    _signupController.passwordTextController,
                                mobileNumberTextController:
                                    _signupController.phoneNumberController,
                              ),
                            );
                          } else {
                            _signupController.signupApis(
                              _signupController.userNameTextController.text,
                              _signupController.emailTextController.text,
                              _signupController.phoneNumberController.text,
                              _signupController.passwordTextController.text,
                            );
                          }
                        },
                      );
              }),
              SizedBox(height: 4.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: CustomTextStyle.mediumTextBS),
                  SizedBox(width: 0.5.h),
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text("Log In", style: CustomTextStyle.mediumTextS1),
                  ),
                ],
              ),
              SizedBox(height: 1.h, width: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
