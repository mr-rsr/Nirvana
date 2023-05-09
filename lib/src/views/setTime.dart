import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:provider/provider.dart';
import '../provider/themeProvider.dart';
import '../res/colors.dart';
import '../res/styles.dart';

class SetTime extends StatefulWidget {
  const SetTime({super.key});

  @override
  State<SetTime> createState() => _SetTimeState();
}

class _SetTimeState extends State<SetTime> {
  var _darkTheme = false;
  final t = Time();
  final minuteController = CarouselController();
  int initialIndex = 0;
  int initialMinuteIndex = 0;
  int currentMinuteIndex = 2;
  Color? colorDark = const Color(0xff979797);
  Color? colorLight = Colors.black;

  void _saveTarget(int target) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return; // User not logged in
    }
    final targetRef = FirebaseFirestore.instance
        .collection('users')
        .doc(user.email)
        .collection('targets')
        .doc();
    try {
      await targetRef.set({
        'target': target,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to save target: $e');
        
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    _darkTheme = (themeProvider.getTheme == darkTheme);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //back button
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: _darkTheme ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
              child: Container(
                height: 335.h,
                width: 347.w,
                decoration: BoxDecoration(
                  color: _darkTheme
                      ? const Color(0xff393E44)
                      : const Color(0xffF5F6FA),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: sort_child_properties_last
                  children: [
                    const SizedBox(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Set a Target!",
                          style: GoogleFonts.lato(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            //color: darkTextColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          "So that we can measure your progress.",
                          style: GoogleFonts.lato(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            //color: darkTextColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(0.0, 16.0),
                      child: ToggleSwitch(
                        minWidth: 160.w,
                        cornerRadius: 30.0.r,
                        activeBgColors: const [
                          [Color(0xffEEE1FD)],
                          [Color(0xff4F445C)]
                        ],
                        activeBorders: [
                          Border.all(
                            color: const Color(0xffBB86FC),
                            width: 1.w,
                          ),
                        ],
                        inactiveBgColor: Colors.black,
                        initialLabelIndex: initialMinuteIndex,
                        totalSwitches: 1,
                        labels: const ['Select Minutes'],
                        customTextStyles: [
                          GoogleFonts.lato(
                            fontSize: 15.6.sp,
                            fontWeight: FontWeight.w600,
                            color: colorLight,
                            decoration: TextDecoration.none,
                          ),
                          GoogleFonts.lato(
                            fontSize: 15.6.sp,
                            fontWeight: FontWeight.w600,
                            color: colorDark,
                            decoration: TextDecoration.none,
                          ),
                        ],
                        radiusStyle: true,
                        onToggle: (index) {
                          setState(() {
                            initialMinuteIndex = index!;
                            if (initialMinuteIndex == 0) {
                              colorDark = const Color(0xff979797);
                              colorLight = Colors.black;
                            } else {
                              colorDark = darkTextColor;
                              colorLight =
                                  Colors.white; // const Color(0xff979797);
                            }
                          });
                        },
                      ),
                    ),
                    wheelScrollerMinute(),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  SizedBox(
                    height: 43.h,
                    width: 120.w,
                     
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        onPressed: () {
                          int Target = 10; 
                          _saveTarget(Target);
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Done",
                          style: GoogleFonts.lato(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: darkTextColor,
                            decoration: TextDecoration.none,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget wheelScrollerMinute() {
    return SizedBox(
      child: CarouselSlider(
          carouselController: minuteController,
          options: CarouselOptions(
              height: 65.h,
              viewportFraction: 0.22,
              reverse: true,
              initialPage: currentMinuteIndex,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) => setState(() {
                    currentMinuteIndex = index;
                  }),
              autoPlayCurve: Curves.easeInBack,
              enlargeCenterPage: true,
              enlargeFactor: .2,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
          items: t.minutes.map((j) {
            return Builder(
              builder: (BuildContext context) {
                return Text(
                  t.minutes[currentMinuteIndex] == j ? '$j m' : '$j',
                  style: GoogleFonts.openSans(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    color: t.minutes[currentMinuteIndex] == j
                        ? !_darkTheme
                            ? lightTextColor
                            : darkTextColor
                        : !_darkTheme
                            ? const Color(0xffD9D9D9)
                            : const Color(0xff606060),
                    decoration: TextDecoration.none,
                  ),
                );
              },
            );
          }).toList()),
    );
  }
}

class Time {
  late List<int> minutes;
  Time() {
    minutes = [];
    for (int i = 1; i < 60; i++) {
      if (i % 5 == 0) minutes.add(i);
    }
  }
}
