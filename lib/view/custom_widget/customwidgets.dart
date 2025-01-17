import 'package:circleapp/controller/utils/app_colors.dart';
import 'package:circleapp/controller/utils/customTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget customTextFormField(TextEditingController? controller, String? hintText,
    {TextInputType? keyboardType,
    Widget? prefixIcon,
    final ValueChanged<String>? onChanged,
    Icon? icon,
    Widget? sufixIcon,
    Color? iconColor,
    String? lableText,
    int? maxLine,
    BorderRadius? borderRadius,
    TextStyle? lableStyle,
    required bool isObsecure,
    EdgeInsets? contentPading,
    Color? hintTextColor,
    bool readOnly = false,
    Callback? isTap}) {
  return TextFormField(
    maxLines: maxLine,
    onChanged: onChanged,
    cursorHeight: 2.h,
    obscureText: isObsecure,
    controller: controller,
    style: CustomTextStyle.hintText,
    cursorColor: Colors.white,
    keyboardType: keyboardType,
    readOnly: readOnly,
    onTap: isTap,
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(30.px), borderSide: const BorderSide(color: AppColors.textFieldColor)),
        filled: true,
        contentPadding: contentPading ?? EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h), // Adjust vertical padding
        isCollapsed: true,
        border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(30.px), borderSide: const BorderSide(color: AppColors.textFieldColor)),
        fillColor: AppColors.textFieldColor,
        prefixIcon: prefixIcon,
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

Widget customRadioButton({String? title, Color? borderColor, SvgPicture? assetsImage}) {
  return Container(
    alignment: Alignment.center,
    height: 4.2.h,
    decoration: BoxDecoration(color: AppColors.textFieldColor, borderRadius: BorderRadius.circular(30.px)),
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

Widget customButton({String? title, Color? backgroundColor, double? height, Callback? onTap, Color? borderColor, double? width, Color? titleColor}) {
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

Widget customLoadingButton(
    {String? title,
    Color? backgroundColor,
    double? height,
    Callback? onTap,
    Color? borderColor,
    double? width,
    Color? titleColor,
    required RxBool loading}) {
  return Obx(() {
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
        child: loading.value
            ? LoadingAnimationWidget.waveDots(color: AppColors.mainColorLogin, size: 35)
            : Text(
                title!,
                style: CustomTextStyle.buttonText.copyWith(color: titleColor),
              ),
      ),
    );
  });
}

Widget customTextButton1({String? title, double? horizentalPadding, double? verticalPadding, Color? bgColor}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: horizentalPadding ?? .7.h, vertical: verticalPadding ?? .1.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.px), color: bgColor ?? AppColors.mainColor, border: Border.all(color: AppColors.secondaryColor)),
    child: Row(
      children: [
        Icon(
          Icons.add,
          color: AppColors.secondaryColor,
          size: 2.h,
        ),
        getHorizentalSpace(.2.h),
        Text(
          title ?? 'Add',
          style: CustomTextStyle.smallText.copyWith(color: AppColors.secondaryColor, fontSize: 12.px),
        )
      ],
    ),
  );
}
Widget customTextButton2({String? title, Color? bgColor, Color? btnTextColor, double? horizentalPadding, verticalPadding}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: horizentalPadding ?? .8.h, vertical: verticalPadding ?? .3.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.px), color: bgColor ?? AppColors.mainColor, border: Border.all(color: AppColors.secondaryColor)),
    child: Row(
      children: [
        getHorizentalSpace(.2.h),
        Text(
          title ?? "View Detail",
          style: CustomTextStyle.smallText.copyWith(color: btnTextColor ?? AppColors.secondaryColor, fontSize: 10.px),
        )
      ],
    ),
  );
}

customScaffoldMessenger(
  BuildContext context,
  String text,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 14.sp,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(seconds: 2),
    ),
  );
}
