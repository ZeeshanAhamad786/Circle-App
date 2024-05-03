import 'package:flutter/material.dart';

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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        child: TextFormField(
          // controller: controller,
          obscureText: obscureText,
          cursorColor: CustomColor.mainColor, // Replace with your CustomColor.mainColor
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 12,
              fontFamily: "regular",
              color: Colors.grey, // Replace with your CustomColor.mainEmailIconGreyColor
            ),
            prefixIcon: Transform.scale(
              scale: 0.5,
              child: prefixIcon,

            ),
            suffixIcon: Transform.scale(
              scale: 0.5,
              child: suffixIcon,

            ),
            contentPadding: EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(36),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      );
  }
}
