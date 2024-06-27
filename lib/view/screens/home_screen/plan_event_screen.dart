import 'package:circleapp/view/screens/explore_section/share_group.dart';
import 'package:circleapp/view/screens/planDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../controller/utils/app_colors.dart';
import '../../../controller/utils/customTextStyle.dart';
import '../../../models/explore-model.dart';
import '../../custom_widget/customwidgets.dart';

class PlanEventScreen extends StatefulWidget {
  const PlanEventScreen({Key? key}) : super(key: key);

  @override
  State<PlanEventScreen> createState() => _PlanEventScreenState();
}

class _PlanEventScreenState extends State<PlanEventScreen> {
  final List<ExploreModel> data = [
    ExploreModel(
        birdOffer: "Imagine Dragon’s Concert",
        totalPrice: "\$2500",
        date: "1/2/2024",
        concertName: "Imagine Dragon’s Concert",
        discription:
        "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
        location: " 13th Street. 47 W 13th St, New York, NY 10011, USA. 20 Cooper Square.",
        interest: "Music",
        images: [
          "assets/png/png4.png",
          "assets/png/png3.png",
          "assets/png/png2.png",
          "assets/png/png1.png"
        ], offerFor: ''),
    ExploreModel(
        birdOffer: "Art Gallery",
        totalPrice: "\$2500",
        date: "1/2/2024",
        concertName: "Imagine Dragon’s Concert",
        discription:
        "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
        location: " 13th Street. 47 W 13th St, New York, NY 10011, USA. 20 Cooper Square.",
        interest: "Music",
        images: [
          "assets/png/png4.png",
          "assets/png/png3.png",
          "assets/png/png2.png",
          "assets/png/png1.png"
        ], offerFor: ''),
    ExploreModel(
        birdOffer: "Early Bird Offer",
        totalPrice: "\$2500",
        date: "1/2/2024",
        concertName: "Imagine Dragon’s Concert",
        discription:
        "Lorem ipsum dolor sit amet consectetur. Eget aliquam suspendisse ultrices a mattis vitae. Adipiscing id vestibulum ultrices lorem. Nibh dignissim bibendum aAdipi.",
        location: " 13th Street. 47 W 13th St, New York, NY 10011, USA. 20 Cooper Square.",
        interest: "Music",
        images: [
          "assets/png/png4.png",
          "assets/png/png3.png",
          "assets/png/png2.png",
          "assets/png/png1.png"
        ], offerFor: '')
  ];
  final List<String> imageUrls = [
    "assets/png/png4.png",
    "assets/png/png3.png",
    "assets/png/png2.png",
    "assets/png/png1.png"
  ];
  final List<Meeting> appointments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SfCalendar(
            backgroundColor: Colors.white,
            viewHeaderStyle: ViewHeaderStyle(backgroundColor: Colors.grey),
            todayHighlightColor: AppColors.mainColorYellow,
            todayTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            view: CalendarView.month,
            dataSource: MeetingDataSource(appointments),
          ),
          getVerticalSpace(1.5.h),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff343434),
                ),
                color: AppColors.mainColorBackground,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.h, right: 5.h, top: 2.5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Plans",
                          style: CustomTextStyle.mediumTextM14,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PlansDetails());
                          },
                          child: Text(
                            "See Details",
                            style: CustomTextStyle.mediumTextTab,
                          ),
                        ),
                      ],
                    ),
                  ),
                  getVerticalSpace(2.5.h),
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Handle onTap
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.2.h, vertical: 2.h),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.textFieldColor),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data[index].birdOffer,
                                        style: CustomTextStyle.mediumTextM14,
                                      ),
                                      Expanded(child: SizedBox()),
                                      Text(
                                        data[index].date,
                                        style: TextStyle(
                                            color:
                                            Colors.white.withOpacity(0.5),
                                            fontSize: 11.px,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "medium"),
                                      ),
                                    ],
                                  ),
                                  getVerticalSpace(.5.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data[index].discription,
                                      style: TextStyle(
                                          color:
                                          Colors.white.withOpacity(0.5),
                                          fontSize: 10.px,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "medium"),
                                    ),
                                  ),
                                  getVerticalSpace(1.h),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                    SvgPicture.asset("assets/svg/Location.svg"),
                                      getHorizentalSpace(1.w),
                                      Expanded(
                                        child: Text(
                                          data[index].location,
                                          style:  TextStyle(
                                              color:
                                              Colors.white.withOpacity(0.5),
                                              fontSize: 8.px,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "medium"),
                                        ),
                                      ),
                                    ],
                                  ),

                                  getVerticalSpace(1.2.h),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Added members",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7), fontSize: 11.px, fontWeight: FontWeight.w400, fontFamily: "medium"),
                                    ),
                                  ),
                                  getVerticalSpace(1.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: SizedBox(
                                            height: 40,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                itemCount: imageUrls.length,
                                                itemBuilder: (BuildContext, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.all(2),
                                                    child: Image.asset(
                                                      imageUrls[index],
                                                      width: 27,
                                                      height: 27,
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          getHorizentalSpace(1.w),
                                          GestureDetector(onTap:() {
                                            Get.to(()=>const ShareGroupScreen());
                                          },
                                              child: SvgPicture.asset("assets/svg/shareButton.svg")),
                                          getHorizentalSpace(2.w),
                                          Container(
                                              height: 3.h,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30), border: Border.all(color: AppColors.mainColorYellow)),
                                              child: Center(
                                                  child: Text(
                                                    "View Details",
                                                    style: CustomTextStyle.mediumTextYellow,
                                                  )))
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
