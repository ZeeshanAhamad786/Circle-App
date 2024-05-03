import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../color/custom_color.dart';
class CustomTextStyle{
  static TextStyle mediumTextL = TextStyle(
      fontSize: 20.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color:  Colors.white);

  static TextStyle mediumTextM = TextStyle(
      fontSize: 12.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: Colors.white);
  static TextStyle mediumTextM14 = TextStyle(
      fontSize: 14.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: Colors.white);
  static TextStyle mediumTextS = TextStyle(
      fontSize: 10.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: CustomColor.mainColorOffWhite);
  static TextStyle mediumTextBS = TextStyle(
      fontSize: 10.px,
      fontWeight: FontWeight.w400,
      fontFamily: 'medium',
      color: CustomColor.mainColorLightBlack);
}