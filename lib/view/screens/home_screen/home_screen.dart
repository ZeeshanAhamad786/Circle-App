import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../controller/utils/color/custom_color.dart';
import '../../../controller/utils/style/customTextStyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, String>> data = [
    {
      "name": "Imagine Dragon’s Concert",
      "date": "12/3/23",
      "subtitle": "hello world"
    },
    {
      "name": "Imagine Dragon’s Concert",
      "date": "12/3/23",
      "subtitle": "hello world"
    },
    {
      "name": "Imagine Dragon’s Concert",
      "date": "12/3/23",
      "subtitle": "hello world"
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColorBackground,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: _tabController,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: CustomColor.mainColorYellow,
                      ),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: CustomTextStyle.mediumTextTab,
                    unselectedLabelColor:
                        CustomColor.mainColorOffWhite.withOpacity(0.5),
                    dividerColor:
                        CustomColor.mainColorOffWhite.withOpacity(0.5),
                    tabs: const [
                      Tab(text: "Plans"),
                      Tab(text: "Itineraries"),
                    ],
                  ),
                ),
              ],
            ),
            SfCalendar(
              backgroundColor: Colors.white,
              viewHeaderStyle: const ViewHeaderStyle(backgroundColor: Colors.green),
              todayHighlightColor: CustomColor.mainColorYellow,
              todayTextStyle: const TextStyle(
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
                      height: 51.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff343434),
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: CustomColor.mainColorBackground,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 3.h, right: 3.h, top: 4.h),
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
                          Expanded(
                            child: ListView.builder(

                                itemCount: data.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 3.h),
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: CustomColor
                                                      .mainColorBackground
                                                      .withOpacity(0.01),
                                                  blurRadius: 30,
                                                  offset: const Offset(0, 3))
                                            ],
                                            color: CustomColor.mainColorLowBlack),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
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
                                                  "will be a sunny day",
                                                  style: CustomTextStyle.mediumTextGrey,
                                                )),
                                                ElevatedButton(
                                                    onPressed: () {},
                                                    style:ElevatedButton.styleFrom(backgroundColor: CustomColor.mainColorYellow),
                                                    child: Text("Booked",style:CustomTextStyle.mediumTextBold,)),
                                              ],
                                            )
                                          ],
                                        )),
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
          ],
        ),
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


class MeetingDataSource extends CalendarDataSource {
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


class Meeting {
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
