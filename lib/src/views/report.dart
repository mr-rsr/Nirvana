import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/res/colors.dart';
import 'package:nirvana/src/res/moodStats.dart';
import 'package:nirvana/src/views/setTime.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nirvana/src/extensions/date_extension.dart';

import '../provider/themeProvider.dart';

class Report extends StatefulWidget {
  Report({super.key, required this.controller});
  final ScrollController controller;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  int mydailytarget = 10;
  late bool darkMode;
  int firstDayOfMonthFallsOnThisDayOfWeek(int year, int month) {
    // Use hours != 0 to avoid daylight-saving issues. Shouldn't be a
    // problem with the 1st of a month, but still good practice.
    return DateTime(year, month, 1, 12).weekday;
  }

  @override
  void initState() {
    final firstDay = firstDayOfMonthFallsOnThisDayOfWeek(year, month);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    darkMode = themeProvider.getDarkMode;
    CalendarFormat cformat = CalendarFormat.month;
    int firstDay = firstDayOfMonthFallsOnThisDayOfWeek(year, month);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: ListView(
            controller: widget.controller,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check Progress',
                        style: GoogleFonts.lato(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        'You are doing great',
                        style: GoogleFonts.lato(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share_outlined, size: 24.sp))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () async {
                  final selectedTarget = await Navigator.push<int>(
                    context,
                    MaterialPageRoute(builder: (context) => const SetTime()),
                  );

                  if (selectedTarget != null) {
                    setState(() {
                      mydailytarget = selectedTarget;
                    });

                    String userEmail =
                        FirebaseAuth.instance.currentUser!.email!;
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userEmail)
                        .set({'target': selectedTarget});
                  }
                },
                child: Container(
                  height: 75.h,
                  width: 335.w,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffA053FF),
                        Color(0xff8857FF),
                        Color(0xff756DFF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 8.0.h, 20.w, 8.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.timer_outlined, size: 14.sp),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'My daily target',
                                  style: GoogleFonts.lato(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '$mydailytarget min',
                              style: GoogleFonts.lato(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward, size: 24))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      smallBox(),
                      smallBox(),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        smallBox(),
                        smallBox(),
                      ]),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: GoogleFonts.lato(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 350.h,
                width: 335.w,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: darkMode
                          ? const Color(0xff393E44)
                          : Color(0xffF5F6FA),
                      width: 1.0,
                    ),
                    left: BorderSide(
                      color: darkMode
                          ? const Color(0xff393E44)
                          : Color(0xffF5F6FA),
                      width: 1.0,
                    ),
                    right: BorderSide(
                      color: darkMode
                          ? const Color(0xff393E44)
                          : Color(0xffF5F6FA),
                      width: 1.0,
                    ),
                    bottom: BorderSide(
                      color: darkMode
                          ? const Color(0xff393E44)
                          : Color(0xffF5F6FA),
                      width: 1.0,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  color: darkMode ? const Color(0xff393E44) : Color(0xffF5F6FA),
                ),
                child: TableCalendar(
                  availableGestures: AvailableGestures.horizontalSwipe,
                  rowHeight: 43.h,
                  firstDay: DateTime.utc(year, month, 1),
                  lastDay: DateTime.utc(year, month + 5, 14),
                  focusedDay: DateTime.now(),
                  //weekNumbersVisible: true,
                  calendarFormat: cformat,
                  formatAnimationCurve: Curves.bounceInOut,
                  startingDayOfWeek: firstDay > 4
                      ? StartingDayOfWeek.sunday
                      : StartingDayOfWeek.tuesday,
                  headerStyle: HeaderStyle(
                    titleCentered: false,
                    formatButtonVisible: false,
                    titleTextStyle: GoogleFonts.lato(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: darkMode ? Colors.white : Colors.black,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: darkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    weekendTextStyle: GoogleFonts.lato(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                    todayDecoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    todayTextStyle: GoogleFonts.lato(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Container(
                height: 55.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                  color: darkMode ? const Color(0xff393E44) : Color(0xffF5F6FA),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 7.r,
                          backgroundColor: const Color(0xffBB86FC),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Daily target crossed',
                          style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 7.r,
                          backgroundColor: const Color(0xffE5E5E5),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Not crossed',
                          style: GoogleFonts.lato(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mood Statistics',
                    style: GoogleFonts.lato(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: SizedBox(
                  height: 220.h,
                  width: 335.w,
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: LineChart(
                      LineChartData(
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: darkMode
                                  ? Color(0xffCCCCCC)
                                  : Color.fromARGB(255, 211, 211, 211),
                              style: BorderStyle.solid,
                              width: 1.sp,
                            ),
                          ),
                          gridData: FlGridData(
                            checkToShowHorizontalLine: (value) =>
                                value % 1 == 0,
                            checkToShowVerticalLine: (value) => value % 1 == 0,
                            verticalInterval: 1,
                            horizontalInterval: 1,
                            show: true,
                            drawVerticalLine: true,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                dashArray: [5, 5],
                                color: darkMode
                                    ? Color(0xffCCCCCC)
                                    : Color.fromARGB(255, 211, 211, 211),
                                strokeWidth: 1.sp,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                dashArray: [5, 5],
                                color: darkMode
                                    ? Color(0xffCCCCCC)
                                    : Color.fromARGB(255, 211, 211, 211),
                                strokeWidth: 1.sp,
                              );
                            },
                          ),
                          minX: 0,
                          maxX: 6,
                          minY: 0,
                          maxY: 4,
                          titlesData: FlTitlesData(
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                interval: 1,
                                reservedSize: 30.h,
                                getTitlesWidget: (value, meta) => Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0.h, left: 8.0.w, right: 8.0.w),
                                  child: Text(
                                    _weekDay[value.toInt()].toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                showTitles: true,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                reservedSize: 30.w,
                                interval: 1,
                                getTitlesWidget: (value, meta) => Padding(
                                  padding: EdgeInsets.only(right: 10.0.w),
                                  child: Text(
                                    mood[value.toInt()].toString(),
                                    style: GoogleFonts.lato(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                                showTitles: true,
                              ),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              belowBarData: BarAreaData(
                                show: true,
                                color: const Color(0xffBB86FC).withOpacity(0.2),
                              ),
                              spots: const [
                                FlSpot(0, 0.2),
                                FlSpot(1, 1.2),
                                FlSpot(2, 2),
                                FlSpot(3, 2.8),
                                FlSpot(4, 0.8),
                                FlSpot(5, 1.7),
                                FlSpot(6, 2.5),
                              ],
                              color: const Color(0xffBB86FC),
                              isCurved: false,
                              barWidth: 1.sp,
                              isStrokeCapRound: true,
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 45.h,
                width: 335.w,
                decoration: BoxDecoration(
                  color: darkMode ? const Color(0xff393E44) : Color(0xffF5F6FA),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Maximum',
                          style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '😄',
                          style: GoogleFonts.lato(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Minimum',
                          style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '😑',
                          style: GoogleFonts.lato(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Container smallBox() {
    return Container(
      height: 108.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: darkMode ? const Color(0xff393E44) : Color(0xffF5F6FA),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0.w, 14.h, 20.w, 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                SizedBox(),
                Icon(
                  Icons.trending_up,
                  color: Colors.red,
                )
              ],
            ),
            Text(
              '30 min',
              style: GoogleFonts.lato(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none),
            ),
            SizedBox(height: 3.h),
            Text(
              'Total Sessions',
              style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  color: Color(0xff7E818C),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }

  static final Map<int, String> mood = {
    0: '😑',
    1: '🙁',
    2: '😓',
    3: '🙂',
    4: '😄',
  };
  static final Map<int, String> _weekDay = {
    0: 'Mon',
    1: 'Tue',
    2: 'Wed',
    3: 'Thu',
    4: 'Fri',
    5: 'Sat',
    6: 'Sun'
  };
}
