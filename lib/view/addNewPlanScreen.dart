import 'package:circleapp/controller/paymentController.dart';
import 'package:circleapp/controller/utils/style/customTextStyle.dart';
import 'package:circleapp/custom_widget/customwidgets.dart';
import 'package:circleapp/view/screens/AddNewEvent.dart';
import 'package:circleapp/view/screens/bookTicketScreen.dart';
import 'package:circleapp/view/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:circleapp/view/screens/createItinerary.dart';
import 'package:circleapp/view/screens/createNewCircleScreens/addMembersScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controller/utils/color/custom_color.dart';

class AddNewPlan extends StatefulWidget {
  const AddNewPlan({super.key,required this.title, });
  final String title;


  @override
  State<AddNewPlan> createState() => _AddNewPlanState();
}

class _AddNewPlanState extends State<AddNewPlan> {
  RxList<int> colorsList = <int>[0xff00B383, 0xffFFC491, 0xff0095FF].obs;
  RxList<String> eventsNameList =
      <String>['Meeting', 'Hangout', 'Trip Plan'].obs;
  // Retrieve the arguments passed from the previous screen
@override
  void initState() {
    // TODO: implement initState
    super.initState();
if(widget.title=='event'){
  List<dynamic> arguments = Get.arguments;

  String eventName = arguments[1];
  eventsNameList.add(eventName);
}


}
  @override
  Widget build(BuildContext context) {

    RxBool isExpand=false.obs;

    final TextEditingController eventNameController = TextEditingController();
    final TextEditingController cardNumberController = TextEditingController();
    final PaymentController paymentController = Get.put(PaymentController());
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.3.h),
        child: SingleChildScrollView(
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
                    'Add New Plan',
                    style: CustomTextStyle.headingStyle,
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              getVerticalSpace(2.9.h),
              Text(
                'Event name*',
                style: CustomTextStyle.buttonText.copyWith(fontSize: 10.px),
              ),
              getVerticalSpace(.5.h),
              customTextFormField(
                eventNameController,
                'Imagine Dragon Concert',
                isObsecure: false,
              ),
              getVerticalSpace(2.h),
              Text(
                'Description',
                style: CustomTextStyle.buttonText.copyWith(fontSize: 10.px),
              ),
              getVerticalSpace(.5.h),
              customTextFormField(cardNumberController, 'Type the note here...',
                  isObsecure: false,
                  keyboardType: TextInputType.text,
                  maxLine: 4,
                  borderRadius: BorderRadius.circular(20.px)),
              getVerticalSpace(2.4.h),
              Obx(
                () => TextField(
                  onTap: () {
                    paymentController.pickedDate(context);
                  },
                  readOnly: true,
                  style: CustomTextStyle.hintText.copyWith(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 1.h,
                      ), // Adjust this value as needed
                      child: Icon(
                        Icons.date_range_rounded,
                        color: CustomColor.secondaryColor,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                        left: 1.h, top: 2.h), // Adjust this value as needed
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.px),
                    ),
                    fillColor: CustomColor.textFieldColor,
                    filled: true,
                    hintStyle: CustomTextStyle.hintText,
                    hintText: '${paymentController.formatedDate}',
                    isCollapsed: true,
                  ),
                ),
              ),
              getVerticalSpace(2.4.h),
              TextField(
                onTap: () {},

                style: CustomTextStyle.hintText.copyWith(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: 1.h,
                    ), // Adjust this value as needed
                    child: Icon(
                      Icons.location_on,
                      color: CustomColor.secondaryColor,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                      left: 1.h, top: 2.h), // Adjust this value as needed
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.px),
                  ),
                  fillColor: CustomColor.textFieldColor,
                  filled: true,
                  hintStyle: CustomTextStyle.hintText,
                  hintText: 'Location',
                  isCollapsed: true,
                ),
              ),
              getVerticalSpace(2.4.h),
              GestureDetector(onTap: (){
                if( isExpand.value==false){
                  isExpand.value=true;
                }else{
                  isExpand.value=false;
                }

              },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 1.2.h, vertical: 1.h),
                  decoration: BoxDecoration(
                      color: CustomColor.textFieldColor,
                      borderRadius: BorderRadius.circular(20.px)),
                  child: Obx(()=>
                   Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Event',
                              style: CustomTextStyle.buttonText,
                            ),
                            Icon(
                              isExpand.value==true? Icons.keyboard_arrow_up: Icons.keyboard_arrow_down,
                              size: 3.2.h,
                              color: Colors.white,
                            )
                          ],
                        ),
                        isExpand.value==true?
                        Row(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: 3,
                                shrinkWrap: true,

                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: .8.h),
                                    padding: EdgeInsets.symmetric(horizontal: 1.h,vertical: 1.h),

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.px),
                                        color: const Color(0xffFFFFFF).withOpacity(0.1)),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                      CircleAvatar(radius: .6.h,backgroundColor:  Color(colorsList[index]),),
                                      getHorizentalSpace(.8.h),
                                      Text(eventsNameList[index],style: CustomTextStyle.buttonText.copyWith(fontSize: 10.px,
                                          color:  Color(colorsList[index])),)
                                    ],),
                                  );
                                },
                              ),
                            ),
                            getHorizentalSpace(9.h),
                            const Expanded(child: SizedBox()),
                            GestureDetector(onTap: (){
                              Get.to(()=>const AddNewEvent());
                            },
                              child: Container(alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 1.h,vertical: .5.h),
                                decoration:  BoxDecoration(
                                border: Border.all(color:CustomColor.secondaryColor ),
                                  borderRadius: BorderRadius.circular(50.px)),
                                child: Text('+ Add new',style: CustomTextStyle.hintText.copyWith(color: CustomColor.secondaryColor),),),
                            )

                          ],
                        ):const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
              getVerticalSpace(2.4.h),
                 Text('Add people',style: CustomTextStyle.buttonText.copyWith(fontSize: 14.px),),

              getVerticalSpace(1.h),

              Row(
                children: [
                  SizedBox(
                    height: 3.5.h,
                    child: ListView.builder(padding: EdgeInsets.zero,
                      shrinkWrap: true,scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemExtent: 4.h,
                      itemBuilder: (context, index) {
                        return  Container(padding: EdgeInsets.symmetric(horizontal: .3.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomColor.secondaryColor),
                            shape: BoxShape.circle
                        ),
                          child: CircleAvatar(radius: 5.6.h,
                            backgroundColor: CustomColor.mainColor,
                            backgroundImage: const AssetImage('assets/png/story.png'),),
                        );
                      },),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(onTap: (){
                    Get.to(()=>const CreateItinerary());
                  },
                    child: GestureDetector(onTap: (){

                      Get.to(()=>AddMembers(title: 'addnewplan',));
                    },
                      child: customTextButton1(
                        title: 'Add Member',horizentalPadding: 1.h,
                        verticalPadding: .5.h,
                        bgColor: Colors.transparent
                      ),
                    ),
                  ),

                ],
              ),
              getVerticalSpace(2.4.h),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Book Ticket ',style:CustomTextStyle.buttonText.copyWith(fontSize: 14.px))
                ,GestureDetector(onTap: (){
                  Get.to(()=>const BookTicket());
                  },
                  child: customTextButton2(
                        title: 'Book',horizentalPadding: 1.5.h,verticalPadding: .4.h,
                  bgColor: Colors.transparent),
                )
              ],),
              getVerticalSpace(4.8.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.3.h),
                child: customButton(
                    onTap: () {

Get.to(()=>const BottomNavigationScreen());
                    },
                    backgroundColor: CustomColor.secondaryColor,
                    borderColor: CustomColor.primaryColor,
                    title: 'Create Plan',
                    titleColor: Colors.black,
                    height: 4.5.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
