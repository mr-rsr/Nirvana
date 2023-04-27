import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageBox extends StatelessWidget {
  const HomePageBox({
    super.key,
    required this.image,
    required this.text,
    this.textColor,
    required this.boxColor,
    this.onTap,
  });
  final Widget image;
  final String text;
  final Color? textColor;
  final Color boxColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 100.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 27.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0.w),
                  child: Text(
                    text,
                    style: GoogleFonts.numans(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              image,
            ],
          ),
        ),
      ),
    );
  }
}
