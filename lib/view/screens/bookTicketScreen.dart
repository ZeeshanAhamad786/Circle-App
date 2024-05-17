import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:circleapp/view/screens/addPaymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class BookTicket extends StatelessWidget {
  const BookTicket({super.key});

  @override
  Widget build(BuildContext context) {
RxInt number=1.obs;
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.3.h),
            child: SingleChildScrollView(
              child: Obx(()=>
                 Column(
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
                          'Book Ticket',
                          style: CustomTextStyle.headingStyle,
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                    getVerticalSpace(2.3.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Imagine Dragon Concert',style: CustomTextStyle.buttonText,)
                    ,                Text('22 April, 2024',style: CustomTextStyle.buttonText,)
                    ],),
                    getVerticalSpace(2.3.h),
                    Text('''Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum a.''',style: CustomTextStyle.hintText,)
                    ,getVerticalSpace(2.3.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                   RichText(text: TextSpan(children: [
                     TextSpan(text: 'Single Ticket  ',style: CustomTextStyle.buttonText),
                     TextSpan(text: '\$${number.value*500}',style: CustomTextStyle.buttonText.copyWith(color: CustomColor.secondaryColor)),
                   ]))
                        ,               Container(padding: EdgeInsets.symmetric(horizontal: 2.h),
                          decoration: BoxDecoration(color: CustomColor.textFieldColor,
                          borderRadius: BorderRadius.circular(10.px),

                        ),child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(onTap: (){
                              if(number.value>0){
                                  number.value=number.value-1;
                              }

                            },
                                child: Text('-',style:CustomTextStyle.buttonText.copyWith(fontSize: 30.px),)),
                          getHorizentalSpace(4.h),
                          Text("${number.value}",style:CustomTextStyle.buttonText,),
                            getHorizentalSpace(4.h),

                            GestureDetector(onTap: (){
                              number.value=number.value+1;
                            },
                                child: Text('+',style:CustomTextStyle.buttonText.copyWith(fontSize: 20.px),)),

                        ],),)
                      ],),
                    getVerticalSpace(2.h),







                  ],
                ),
              ),
            ),
          ),
          const Divider(color: Color(0xff484848),),
          Obx(()=>
             Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.3.h),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Text(
                    'TOTAL',
                    style: CustomTextStyle.buttonText,
                  ),
                  Text('\$${number.value*500}',style: CustomTextStyle.buttonText.copyWith(color: CustomColor.secondaryColor)),


                ],
              ),
            ),
          ),
          getVerticalSpace(12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.5.h),
            child: customButton(
                onTap: () {
Get.to(()=>const PaymentScreen(title: 'bookTicket',));

                },
                backgroundColor: CustomColor.secondaryColor,
                borderColor: CustomColor.primaryColor,
                title: 'Pay',
                titleColor: Colors.black,
                height: 4.5.h),
          ),

        ],
      ),
    );
  }
}
