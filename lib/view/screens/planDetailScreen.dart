import 'package:circleapp/controller/utils/color/custom_color.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:circleapp/view/addNewPlanScreen.dart';
import 'package:circleapp/view/screens/tripPlanScreens/winterTripPlanDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlansDetails extends StatelessWidget {
  const PlansDetails({super.key});

  @override
  Widget build(BuildContext context) {
    RxList<int>colorsList=<int>[0xff00B383,0xffFFC491,0xff0095FF].obs;
    RxList<String>eventsNameList=<String>['Meeting','Hangout','Trip Plan'].obs;
    return  Scaffold(backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 2.3.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Plan details',
                  style: CustomTextStyle.headingStyle,
                ),const Expanded(child: SizedBox()),
                GestureDetector(onTap: (){
                  Get.to(()=>const AddNewPlan(title: 'plansDetail'));
                },
                    child: customTextButton2(bgColor: const Color(0xffFFC491),title: 'Add New Plan',btnTextColor: const Color(0xff323232)))
              ],
            ),

            getVerticalSpace(3.5.h),

       Text('Events',style: CustomTextStyle.headingStyle,),
            getVerticalSpace(.4.h),
            SizedBox(
              height: 3.h,width: MediaQuery.of(context).size.width-2.3.h,
              child: ListView.builder(padding: EdgeInsets.zero,
                itemCount: 3,shrinkWrap: true,scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return Container(padding: EdgeInsets.symmetric(horizontal: 1.5.h,vertical: .5.h),
                  margin:index==0?EdgeInsets.zero: EdgeInsets.symmetric(horizontal: 1.h),
               decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.px),
                  color: CustomColor.textFieldColor
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CircleAvatar(radius: .6.h,backgroundColor:  Color(colorsList[index]),),
                  getHorizentalSpace(.5.h),
                  Text(eventsNameList[index],style: CustomTextStyle.buttonText.copyWith(fontSize: 10.px,
                      color:  Color(colorsList[index])),)
                ],),);
              },),
            ),
            getVerticalSpace(2.5.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: colorsList.length,

              physics: const NeverScrollableScrollPhysics(),

              itemBuilder: (context, index) {
                return
                  Dismissible(
                    background: Container(padding: EdgeInsets.only(right: 4.h),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(color: CustomColor.secondaryColor,
                        borderRadius:   BorderRadius.circular(10.px),
                      ),child: SvgPicture.asset('assets/svg/deleteicon.svg'),
                    ),
                    key: Key(index.toString()),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=>const WinterTripPlanDetails());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h,),
                        alignment: Alignment.center,

                        padding: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(color: CustomColor.mainColor,
                          borderRadius:   BorderRadius.circular(10.px),

                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(radius: .5.h,backgroundColor:  Color(colorsList[index]),),
                                getHorizentalSpace(.8.h),
                                Text('Imagine Dragon’s Concert',style: CustomTextStyle.headingStyle,),
                                const Expanded(child: SizedBox()),
                                Text('10:00-13:00',style: CustomTextStyle.hintText,),
                                getVerticalSpace(1.h),
                              ],
                            ),
                            Row(
                              children: [
                                getHorizentalSpace(2.h),
                                Expanded(child: Text(''' will be a sunny day''',style: CustomTextStyle.hintText,)),
                                customTextButton2(
                                    title: 'Booked',
                                    bgColor: CustomColor.secondaryColor,
                                    btnTextColor: Colors.black
                                )
                              ],
                            ),


                          ],),
                      ),
                    ),
                  );
              },),



          ],),
      ),);
  }
}
