import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controller/utils/color/custom_color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget?  prefixIcon;
  final Widget?  suffixIcon;
  // final TextEditingController controller;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    // required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: CustomColor.mainColor,
        ),
        child: TextFormField(
          // controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.white, // Replace with your CustomColor.mainColor
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 10.px,
              fontFamily: "medium",
              color:Colors.white// Replace with your CustomColor.mainEmailIconGreyColor
            ),
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Transform.scale(
              scale: 0.4,
              child: prefixIcon,

            ),
            suffixIcon: Transform.scale(
              scale: 0.4,
              child: suffixIcon,

            ),
            // isDense: true,

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
              borderSide: BorderSide(color: CustomColor.mainColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
              borderSide: BorderSide(color: CustomColor.mainColor),
            ),
          ),
        ),
      );
  }
}
