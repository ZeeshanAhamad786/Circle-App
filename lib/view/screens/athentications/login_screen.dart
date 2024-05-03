import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import '../../../custom_widget/custom_text_field.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: CustomColor.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: 11.h,
              ),
              Center(
                  child: Image.asset(
                    "assets/png/loginScreen.png",
                  )),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Welcome Back!",
                style: CustomTextStyle.mediumTextL,),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Please enter the required details",
                style: CustomTextStyle.mediumTextS,),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Welcome Back!",
                style: CustomTextStyle.mediumTextL,),
              CustomTextField(hintText: "Email",),
              SizedBox(
                height: 1.5.h,
              ),
              CustomTextField(hintText: "Password", prefixIcon: SvgPicture.asset("assets/svg/lock.svg"),
                suffixIcon: SvgPicture.asset("assets/svg/eye.svg"),),
              SizedBox(height: 2.h,),
              Align(alignment: Alignment.centerRight,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.h),
                    child: GestureDetector(onTap: () {
                      // Get.to(()=>ResetPasswordScreen());
                    },
                        child: Text("Forgot Password",style: TextStyle(fontFamily: "medium",color: Colors.black,fontSize: 10.px,),)),
                  )),
              SizedBox(height:6.h ,),
              // CustomMainButton(buttonText: "Sign-in",buttonColor: CustomColor.mainColor,
              //     onPressed: (){}),
              SizedBox(height: 1.4.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I don't an account",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color:  Colors.black,
                          fontSize: 12.px,
                          fontFamily:"regular"
                      )),
                  SizedBox(
                    width: 0.5.h,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.to(()=>SignUpScreen());
                    },
                    child: Text("Sign-up ",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.cyan,
                            fontSize: 12.px,
                            fontFamily:"medium"
                        )),
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
