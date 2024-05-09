import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextStyle{
  static TextStyle mediumTextL = TextStyle(
      fontSize: 20.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color:  Colors.white);

  static TextStyle mediumTextS = TextStyle(
      fontSize: 12.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: Colors.white);
  static TextStyle mediumTextM = TextStyle(
      fontSize: 12.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: Colors.white);
  static TextStyle headingStyle = TextStyle(
      fontSize: 16.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: const Color(0xffF8F8F8));
  static TextStyle smallText = TextStyle(
      fontSize: 12.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: const Color(0xffF8F8F8));
  static TextStyle hintText = TextStyle(
      fontSize: 10.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color:CustomColor.hintTextColor);
  static TextStyle buttonText = TextStyle(
      fontSize: 14.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color:CustomColor.hintTextColor);

  static TextStyle mediumTextM14 = TextStyle(
      fontSize: 14.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: Colors.white);
  static TextStyle mediumTextS1 = TextStyle(
      fontSize: 10.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: CustomColor.mainColorOffWhite);
  static TextStyle mediumTextBS = TextStyle(
      fontSize: 10.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: CustomColor.mainColorLightBlack);
  static TextStyle mediumTextBN = TextStyle(
      fontSize: 10.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: Colors.white);
  static TextStyle mediumTextTab = TextStyle(
      fontSize: 14.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: CustomColor.mainColorYellow);
  static TextStyle mediumTextGrey = TextStyle(
      fontSize: 12.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: CustomColor.mainColorGrey);
  static TextStyle mediumTextBold = TextStyle(
      fontSize: 10.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: CustomColor.mainColorLogin
  );
}