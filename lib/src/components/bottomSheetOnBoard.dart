import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/views/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../res/colors.dart';

class BottomSheetOnBoard extends StatelessWidget {
  const BottomSheetOnBoard({
    super.key,
    required this.controller,
    this.hour,
    this.minute,
  });

  final PageController controller;
  final CarouselController? hour;
  final CarouselController? minute;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 40.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: controller,
            count: 2,
            onDotClicked: (index) => controller.page == 0
                ? controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  )
                : controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
            effect: ExpandingDotsEffect(
              dotColor: Colors.black,
              activeDotColor: Colors.grey,
              dotHeight: 8.h,
              dotWidth: 8.w,
              expansionFactor: 2,
              spacing: 4.0.h,
            ),
          ),
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
                  if (controller.page == 0) {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                    setInit();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                },
                child: Text(
                  "Next",
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
    );
  }

  setInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("initScreen", 1);
  }
}
