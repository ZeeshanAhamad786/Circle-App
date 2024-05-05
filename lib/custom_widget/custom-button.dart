import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../controller/utils/color/custom_color.dart';

class CustomMainButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? buttonColor;

  // final  RxBool? loading;

  CustomMainButton({
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    // this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size( MediaQuery.of(context).size.width, 6.h),
        backgroundColor: buttonColor, // Button color

        // Text color
      ),
      child: Text(buttonText,
          textAlign: TextAlign.center,
          style:  TextStyle(
            fontSize: 14.px,
            color: CustomColor.mainColorLogin,
            fontFamily: "medium",
          )),
    );
  }
}