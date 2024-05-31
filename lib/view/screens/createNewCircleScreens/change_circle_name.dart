import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/color/custom_color.dart';
import '../../custom_widget/customwidgets.dart';

class ChangeCircleName extends StatelessWidget {
  const ChangeCircleName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerticalSpace(8.h),
            Text(
              "Change circle name",
              style: CustomTextStyle.mediumTextExplore,
            ),
            getVerticalSpace(6.h),
            Text(
              "Circle name",
              style: CustomTextStyle.mediumTextS1,
            ),
            getVerticalSpace(1.h),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Hiking Plan",
                  hintStyle: TextStyle(fontWeight: FontWeight.w400, fontFamily: "medium", fontSize: 10.px, color: Colors.white),
                  filled: true,
                  fillColor: CustomColor.textFieldColor,
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: CustomColor.textFieldColor,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: CustomColor.textFieldColor,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: CustomColor.textFieldColor,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
