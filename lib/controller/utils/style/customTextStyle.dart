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

}