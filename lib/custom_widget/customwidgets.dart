import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget customTextFormField(
  TextEditingController? controller,
  String? hintText, {
  TextInputType? keyboardType,
  IconData? prefixIcon,
  final ValueChanged<String>? onChanged,
  Icon? icon,
  IconButton? sufixIcon,
  Color? iconColor,
  String? lableText,
  int? maxLine,
  BorderRadius? borderRadius,
  TextStyle? lableStyle,
  required bool isObsecure,
  EdgeInsetsDirectional? contentPading,
  Color? hintTextColor,
}) {
  return TextFormField(
    maxLines: maxLine,
    onChanged: onChanged,
    cursorHeight: 2.h,
    obscureText: isObsecure,
    controller: controller,
    style: CustomTextStyle.hintText,
    cursorColor: CustomColor.textFieldColor,
    textAlign: TextAlign.left,
    keyboardType: keyboardType,
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(30.px),
            borderSide: const BorderSide(color: CustomColor.textFieldColor)),
        filled: true,
        contentPadding: contentPading ??
            EdgeInsets.symmetric(
                horizontal: 2.h, vertical: 1.5.h), // Adjust vertical padding
        isCollapsed: true,
        border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(30.px),
            borderSide: const BorderSide(color: CustomColor.textFieldColor)),
        fillColor: CustomColor.textFieldColor,
        // prefixIcon: Icon(
        //   prefixIcon,
        //   color:iconColor?? Colors.white,
        //   size: 2.4.h,
        // ),
        suffixIcon: sufixIcon,
        hintText: hintText,
        hintStyle: CustomTextStyle.hintText,
        labelText: lableText,
        labelStyle: lableStyle),
  );
}

Widget getVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget getHorizentalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

Widget customRadioButton(
    {String? title, Color? borderColor, SvgPicture? assetsImage}) {
  return Container(
    alignment: Alignment.center,
    height: 4.2.h,
    decoration: BoxDecoration(
        color: CustomColor.textFieldColor,
        borderRadius: BorderRadius.circular(30.px)),
    child: Row(
      children: [
        getHorizentalSpace(2.h),
        Container(
          height: 1.8.h,
          width: 1.8.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor!),
          ),
          child: assetsImage,
        ),
        getHorizentalSpace(2.h),
        Text(
          title!,
          style: CustomTextStyle.smallText,
        ),
      ],
    ),
  );
}

Widget customButton(
    {String? title,
    Color? backgroundColor,
    double? height,
    Callback? onTap,
    Color? borderColor,
    double? width,
    Color? titleColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.px),
        color: backgroundColor,
        border: Border.all(color: borderColor!),
      ),
      child: Text(
        title!,
        style: CustomTextStyle.buttonText.copyWith(color: titleColor),
      ),
    ),
  );
}
Widget customTextButton1(
{String? title,
  double? horizentalPadding,
  double? verticalPadding,
}){
  return   Container(padding: EdgeInsets.symmetric(horizontal:horizentalPadding?? .7.h,vertical:verticalPadding?? .1.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.px),
        color: CustomColor.mainColor,
        border: Border.all(color: CustomColor.secondaryColor)
    ),
    child: Row(children: [
      Icon(Icons.add,color: CustomColor.secondaryColor,size: 2.h,),
      getHorizentalSpace(.2.h),
      Text(title??'Add',style: CustomTextStyle.smallText.copyWith(color: CustomColor.secondaryColor,fontSize: 12.px),)
    ],),);
}
Widget customTextButton2({String? title, Color? bgColor,Color? btnTextColor}){
  return   Container(padding: EdgeInsets.symmetric(horizontal: .8.h,vertical: .1.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.px),
        color:bgColor?? CustomColor.mainColor,
        border: Border.all(color: CustomColor.secondaryColor)
    ),
    child: Row(children: [
      getHorizentalSpace(.2.h),
      Text(title??"View Detail",style: CustomTextStyle.smallText.copyWith(color:btnTextColor?? CustomColor.secondaryColor,fontSize: 10.px),)
    ],),);
}