import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/custom-button.dart';
import 'package:circleapp/custom_widget/custom_text_field.dart';
import 'package:circleapp/view/screens/athentications/forget_password.dart';
import 'package:circleapp/view/screens/athentications/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                    "Name",
                    style:TextStyle(color: Colors.white.withOpacity(0.6),fontFamily: "medium",fontSize: 10.px)),
              ),
              SizedBox(height: 0.4.h,),
              CustomTextField(hintText: "Lita han",prefixIcon: SvgPicture.asset("assets/svg/profile.svg"),),
              SizedBox(height:2.5.h),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                    "Email",
                    style:TextStyle(color: Colors.white.withOpacity(0.6),fontFamily: "medium",fontSize: 10.px)),
              ),
              SizedBox(height: 0.4.h,),
              CustomTextField(hintText: "Litahan12@gmail.com",prefixIcon: SvgPicture.asset("assets/svg/email.svg"),),
              SizedBox(
                height: 2.5.h,
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                    "Password",
                    style:TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 10.px,fontFamily: "medium")),
              ),
              SizedBox(height: 0.4.h,),
              CustomTextField(hintText: "**********", prefixIcon: SvgPicture.asset("assets/svg/lock.svg"),
                suffixIcon: SvgPicture.asset("assets/svg/closeEye.svg"),),
              SizedBox(
                height: 2.5.h,
              ),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                    "Confirm Password",
                    style:TextStyle(color: Colors.white.withOpacity(0.6),fontSize: 10.px,fontFamily: "medium")),
              ),
              SizedBox(height: 0.4.h,),
              CustomTextField(hintText: "**********", prefixIcon: SvgPicture.asset("assets/svg/lock.svg"),
                suffixIcon: SvgPicture.asset("assets/svg/closeEye.svg"),),
              SizedBox(height:4.h ,),
              CustomMainButton(buttonText: "Sign Up",buttonColor: CustomColor.mainColorYellow,
                  onPressed: (){}),
              SizedBox(height: 4.h,),
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
                      Get.to(()=>LoginScreen());
                    },
                    child: Text("Log In",
                        style: CustomTextStyle.mediumTextS1),
                  ),
                ],
              ),
              SizedBox(height: 1.h,width: 1.h,)
            ],
          ),
        ),
      ),
    );
  }
}
