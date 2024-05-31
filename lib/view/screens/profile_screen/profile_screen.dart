import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/view/custom_widget/customwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              getVerticalSpace(8.h),
              Center(child: Text("Profile", style: CustomTextStyle.mediumTextExplore)),
              getVerticalSpace(2.h),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/png/profileMain.png"),
                    radius: 60,
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColors.mainColorBackground),
                      child: Transform.scale(
                          scale: 0.6,
                          child: SvgPicture.asset(
                            "assets/svg/profileCamera.svg",
                          )),
                    ),
                  ),
                ],
              ),
              getVerticalSpace(4.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name",
                    style: CustomTextStyle.mediumTextSubtitle,
                  )),
              TextFormField(
                cursorColor: Colors.white,
                decoration: InputDecoration.collapsed(
                    hintText: "ZEESHAN",
                    hintStyle: TextStyle(fontSize: 14.px, fontWeight: FontWeight.w400, fontFamily: 'medium', color: Colors.white)),
              ),
              Divider(
                color: Colors.white.withOpacity(0.1),
              ),
              getVerticalSpace(2.h),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: CustomTextStyle.mediumTextSubtitle,
                  )),
              TextFormField(
                cursorColor: Colors.white,
                decoration: InputDecoration.collapsed(
                    hintText: "Litahan12@gmail.com",
                    hintStyle: TextStyle(fontSize: 14.px, fontWeight: FontWeight.w400, fontFamily: 'medium', color: Colors.white)),
              ),
              Divider(
                color: Colors.white.withOpacity(0.1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
