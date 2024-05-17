import 'package:circleapp/view/screens/athentications/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import '../../../custom_widget/custom-button.dart';
import '../../../custom_widget/custom_text_field.dart';
import '../createNewCircleScreens/choose_image.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: CustomColor.mainColorBackground,
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
                    "assets/png/loginScreen.png",height: 272.px,width: 272.px,
                  )),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Welcome Back!",
                style: CustomTextStyle.mediumTextL,),
              SizedBox(
                height: 0.8.h,
              ),
              Text(
                "Please enter the required details",
                style: CustomTextStyle.mediumTextS1,),
              SizedBox(
                height: 4.h,
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style:TextStyle(color: Colors.white.withOpacity(0.6),fontFamily: "medium",fontSize: 10.px)),
              ),
              SizedBox(height: 0.4.h,),
              CustomTextField(hintText: "Litahan12@gmail.com",prefixIcon: SvgPicture.asset("assets/svg/email.svg"),),
              SizedBox(
                height: 1.5.h,
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                    style:TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 10.px,fontFamily: "medium")),
              ),
              SizedBox(height: 0.4.h,),
              CustomTextField(hintText: "**********", prefixIcon: SvgPicture.asset("assets/svg/lock.svg"),
                suffixIcon: SvgPicture.asset("assets/svg/closeEye.svg"),),
              SizedBox(height: 0.5.h,),
              Align(alignment: Alignment.centerRight,
                  child: GestureDetector(onTap: () {
                    Get.to(()=>const ForgetScreen());
                  },
                      child: Text("Forgot Password?",style: CustomTextStyle.mediumTextS1,))),
              SizedBox(height:2.h ,),
              CustomMainButton(buttonText: "Log In",buttonColor: CustomColor.mainColorYellow,
                  onPressed: (){
Get.to(()=>const ChooseImage());
                  }),
              SizedBox(height: 1.4.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: CustomTextStyle.mediumTextBS),
                  SizedBox(
                    width: 0.5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(()=>SignUpScreen());
                    },
                    child: Text("Create Account",
                        style: CustomTextStyle.mediumTextS1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
