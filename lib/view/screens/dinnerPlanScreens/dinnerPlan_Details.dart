import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/view/screens/addPaymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../custom_widget/customwidgets.dart';

class DinnerPlanDetails extends StatelessWidget {
  const DinnerPlanDetails({super.key});

  @override
  Widget build(BuildContext context) {
    RxList<String> statusList = <String>['Total bill', 'Paid', 'Pending'].obs;
    RxList<String> paymentList = <String>['2500\$', '500\$', '2000\$'].obs;
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getVerticalSpace(6.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 2.h,
                  ),
                ),
                getHorizentalSpace(1.5.h),
                Text(
                  'Dinner plan details',
                  style: CustomTextStyle.headingStyle,
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            getVerticalSpace(2.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: .5.h),
                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: .6.h),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.px), color: CustomColor.textFieldColor),
                  child: Row(
                    children: [
                      Text(
                        statusList[index],
                        style: CustomTextStyle.headingStyle,
                      ),
                      const Expanded(child: SizedBox()),
                      Text(paymentList[index],
                          style: CustomTextStyle.smallText.copyWith(
                              color: index == 1
                                  ? const Color(0xff79F966)
                                  : index == 2
                                      ? const Color(0xffFF881A)
                                      : const Color(0xffF8F8F8))),
                    ],
                  ),
                );
              },
            ),
            getVerticalSpace(2.3.h),
            Text(
              'Pending Amount',
              style: CustomTextStyle.headingStyle.copyWith(color: Colors.white),
            ),
            getVerticalSpace(1.h),
            GestureDetector(
              onTap: () {
                Get.to(() => const PaymentScreen(
                      title: 'dinnerPlan',
                    ));
              },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: .5.h),
                    padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: .6.h),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.px), color: CustomColor.textFieldColor),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 2.4.h,
                          backgroundColor: CustomColor.mainColorBackground,
                          backgroundImage: const AssetImage('assets/png/postimage.jpeg'),
                        ),
                        getHorizentalSpace(.81.h),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(text: 'Han’s', style: CustomTextStyle.buttonText.copyWith(color: Colors.white)),
                          TextSpan(text: ' 500\$', style: CustomTextStyle.buttonText.copyWith(color: const Color(0xffFF881A))),
                          TextSpan(text: ' are pending', style: CustomTextStyle.buttonText.copyWith(color: Colors.white)),
                        ])),
                        const Expanded(child: SizedBox()),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: .4.h),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.px), color: const Color(0xff00B332)),
                          child: Text(
                            'Pay',
                            style: CustomTextStyle.buttonText.copyWith(color: Colors.white, fontSize: 10.px),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            getVerticalSpace(2.h),
            Text(
              'Paid Amount',
              style: CustomTextStyle.headingStyle.copyWith(color: Colors.white),
            ),
            getVerticalSpace(1.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: .5.h),
                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: .6.h),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.px), color: CustomColor.textFieldColor),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 2.4.h,
                        backgroundColor: CustomColor.mainColorBackground,
                        backgroundImage: const AssetImage('assets/png/postimage.jpeg'),
                      ),
                      getHorizentalSpace(.81.h),
                      Text('Lita paid 500\$', style: CustomTextStyle.buttonText.copyWith(color: Colors.white)),
                      const Expanded(child: SizedBox()),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: .4.h),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.px), color: const Color(0xff00B332).withOpacity(0.5)),
                        child: Text(
                          'Pay',
                          style: CustomTextStyle.buttonText.copyWith(color: Colors.white.withOpacity(0.5), fontSize: 10.px),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            getVerticalSpace(2.h),
            Text(
              'Added person',
              style: CustomTextStyle.headingStyle.copyWith(color: Colors.white),
            ),
            getVerticalSpace(1.h),
            SizedBox(
              height: 4.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemExtent: 5.h,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: .3.h),
                    decoration: BoxDecoration(border: Border.all(color: CustomColor.secondaryColor), shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: 10.h,
                      backgroundColor: CustomColor.mainColor,
                      backgroundImage: const AssetImage('assets/png/story.png'),
                    ),
                  );
                },
              ),
            ),
            getVerticalSpace(2.h),
            Text(
              'Bill receipt',
              style: CustomTextStyle.headingStyle.copyWith(color: Colors.white),
            ),
            getVerticalSpace(1.h),
            SizedBox(
              height: 4.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemExtent: 5.h,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: .5.h),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.px),
                            color: CustomColor.textFieldColor,
                            image: const DecorationImage(image: AssetImage('assets/png/postimage.jpeg'), fit: BoxFit.cover)),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
