import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/components/bottomSheetOnBoard.dart';
import 'package:nirvana/src/provider/themeProvider.dart';
import 'package:nirvana/src/res/assetsImages.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/colors.dart';
import '../res/styles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var _darkTheme = false;
  bool minuteSelected = true;
  final t = Time();
  final controller = PageController(initialPage: 0);
  final minuteController = CarouselController();
  final hourController = CarouselController();

  int currentPage = 0;
  int initialIndex = 0;
  int initialMinuteIndex = 0;
  int currentMinuteIndex = 2;
  int currentHourIndex = 2;
  Color? colorDark = const Color(0xff979797);
  Color? colorLight = Colors.black;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    initialIndex = _darkTheme ? 1 : 0;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(
                    image: AssetImage(darkThemeLogo),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Choose a style",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      //color: darkTextColor,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, right: 40.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Customize your interface. It will help you to",
                          style: GoogleFonts.lato(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            //color: darkTextColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          "comfort your eyes.",
                          style: GoogleFonts.lato(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            //color: darkTextColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        ToggleSwitch(
                          minWidth: 97.w,
                          cornerRadius: 20.0.r,
                          activeBgColors: const [
                            [Colors.white],
                            [Color(0xff515151)]
                          ],
                          inactiveBgColor: Colors.black,
                          initialLabelIndex: initialIndex,
                          totalSwitches: 2,
                          labels: const ['Light', 'Dark'],
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
                              initialIndex = index!;
                              if (initialIndex == 0) {
                                _darkTheme = false;
                                colorDark = const Color(0xff979797);
                                colorLight = Colors.black;
                              } else {
                                colorDark = darkTextColor;
                                colorLight = const Color(0xff625E5E);
                                _darkTheme = true;
                              }
                            });
                            onThemeChanged(_darkTheme, themeProvider);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              BottomSheetOnBoard(
                controller: controller,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 40.h, left: 8.w, right: 8.w),
                child: Column(
                  children: [
                    Row(
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
                            controller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                        ),
                        const SizedBox(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          height: 25.h,
                          width: 25.h, //0.263 * width,
                          image: const AssetImage(splashImage),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text('Nirvana',
                            style: GoogleFonts.mukta(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w600,
                              //color: darkTextColor,
                              decoration: TextDecoration.none,
                            )),
                      ],
                    ),
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
                      ToggleSwitch(
                        minWidth: 97.w,
                        cornerRadius: 20.0.r,
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
                        totalSwitches: 2,
                        labels: const ['Minute', 'Hour'],
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
                            minuteSelected = index == 0 ? true : false;
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
                      initialMinuteIndex == 0
                          ? wheelScrollerMinute()
                          : wheelScrollerHour(),
                      const SizedBox(),
                    ],
                  ),
                ),
              ),
              BottomSheetOnBoard(
                controller: controller,
                hour: hourController,
                minute: minuteController,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget wheelScrollerHour() {
    return CarouselSlider(
      carouselController: hourController,
      options: CarouselOptions(
        height: 65.h,
        enlargeFactor: .2,
        viewportFraction: 0.22,
        initialPage: currentHourIndex,
        enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        reverse: true,
        onPageChanged: (index, reason) => setState(() {
          currentHourIndex = index;
          debugPrint('currentHourIndex: ${t.hours[currentHourIndex]}');
        }),
        autoPlayCurve: Curves.easeInBack,
        enlargeCenterPage: true,
      ),
      items: t.hours.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Text(
              t.hours[currentHourIndex] == i ? '$i hr' : '$i',
              style: GoogleFonts.openSans(
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
                color: t.hours[currentHourIndex] == i
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
      }).toList(),
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

  void onThemeChanged(bool value, ThemeProvider themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme, true)
        : themeNotifier.setTheme(lightTheme, false);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(dark, value);
  }
}

class Time {
  late List<int> minutes;
  late List<int> hours;
  Time() {
    hours = [];
    minutes = [];
    for (int i = 1; i < 60; i++) {
      if (i % 5 == 0) minutes.add(i);
    }
    for (int i = 1; i <= 12; i++) {
      hours.add(i);
    }
  }
}
