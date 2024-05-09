import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import 'home_screen.dart';
class PlanEventScreen extends StatefulWidget {
  const PlanEventScreen({Key? key}) : super(key: key);

  @override
  State<PlanEventScreen> createState() => _PlanEventScreenState();
}

class _PlanEventScreenState extends State<PlanEventScreen> {
  List<Map<String, String>> data = [
    {
      "name": "Imagine Dragon’s Concert",
      "date": "12/3/23",
      "subtitle": "will be a sunny day"
    },
    {
      "name": "Art Gallery",
      "date": "12/7/23",
      "subtitle": "hello world"
    },
    {
      "name": "Aroura Lights",
      "date": "12/1/23",
      "subtitle": "best time to visit Norway"
    },
    {
      "name": "Imagine Dragon’s Concert",
      "date": "12/3/23",
      "subtitle": "hello world"
    }, {
      "name": "Imagine Dragon’s Concert",
      "date": "12/3/23",
      "subtitle": "hello world"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: SingleChildScrollView(
  child: Column(children: [
    SfCalendar(
      backgroundColor: Colors.white,
      viewHeaderStyle: ViewHeaderStyle(backgroundColor: Colors.green),
      todayHighlightColor: CustomColor.mainColorYellow,
      todayTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
  
      view: CalendarView.month,
      dataSource: MeetingDataSource(_getDataSource()),
  
      // by default the month appointment display mode set as Indicator, we can
      // change the display mode as appointment using the appointment display
      // mode property
      // monthViewSettings: const MonthViewSettings(
      //     showAgenda: true,
      //     appointmentDisplayMode:
      //     MonthAppointmentDisplayMode.appointment),
    ),
    GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff343434),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: CustomColor.mainColorBackground,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 5.h, right: 5.h, top: 4.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Events",
                          style: CustomTextStyle.mediumTextM14,
                        ),
                        Text(
                          "See Details",
                          style: CustomTextStyle.mediumTextTab,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h,),
                  Expanded(
                    child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Dismissible(
                              key: Key("$index"),
                              onDismissed: (DismissDirection){
                                setState(() {data.removeAt(index);});
                              },
                              background: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red),// Background color when swiping
                                child: Icon(Icons.delete, color: Colors.white),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 5.h),
                              ),
                              child: Container(
                                  margin:
                                  EdgeInsets.symmetric(horizontal: 3.h),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: CustomColor
                                                .mainColorBackground
                                                .withOpacity(0.01),
                                            blurRadius: 30,
                                            offset: Offset(0, 3))
                                      ],
                                      color: CustomColor.mainColorLowBlack),
                                  child: Column(
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data[index]["name"]!,
                                            style:
                                            CustomTextStyle.mediumTextM,
                                          ),
                                          Text(data[index]["date"]!,style:CustomTextStyle.mediumTextBold,),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              child: Text(
                                                data[index]["subtitle"]!,
                                                style: CustomTextStyle.mediumTextGrey,
                                              )),
                                          ElevatedButton(
                                              onPressed: () {},
                                              style:ElevatedButton.styleFrom(backgroundColor: CustomColor.mainColorYellow,
                                                  minimumSize: Size(60, 30)
                                              ),
                                              child: Text("Booked",style:CustomTextStyle.mediumTextBold,
                                              )),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CustomColor.mainColorBackground,
      ),
    )
  ],),
),
    );
  }
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}