import 'package:circleapp/view/screens/home_screen/plan_event_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';
import '../../../custom_widget/customwidgets.dart';
class ItineraryEventScreen extends StatefulWidget {
  const ItineraryEventScreen({Key? key}) : super(key: key);

  @override
  State<ItineraryEventScreen> createState() => _ItineraryEventScreenState();
}

class _ItineraryEventScreenState extends State<ItineraryEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
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
          ListView.builder(padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: 3.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: 1.h),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      CircleAvatar(radius: .6.h,backgroundColor: Colors.white,),
                      getHorizentalSpace(.5.h),
                      Text('Start the day with a visit to the',style: CustomTextStyle.buttonText.copyWith(color: Colors.white),),
                      const Expanded(child: SizedBox()),
                      Text('09:00 AM',style: CustomTextStyle.buttonText.copyWith(color: Colors.white),)

                    ],),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getHorizentalSpace(2.h),
                        Text('British Museum.',style: CustomTextStyle.headingStyle.copyWith(color: CustomColor.secondaryColor),),
                      ],
                    ),
                    getVerticalSpace(.6.h),
                    Divider(color: CustomColor.secondaryColor,)
                  ],),
              );
            },)
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