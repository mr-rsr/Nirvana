import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/colors.dart';

class MusicCoverWidget extends StatelessWidget {
  const MusicCoverWidget({
    super.key,
    required this.image,
    required this.text,
    this.height,
    this.width,
    this.fontSize,
  });
  final ImageProvider image;
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height ?? 144.h,
          width: width ?? 144.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: image,
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 13.h,
                right: 13.w,
                child: Container(
                    height: 18.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 15,
                        ),
                        Text(
                          '10min',
                          style: GoogleFonts.lato(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                            color: darkTextColor,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          text,
          style: GoogleFonts.lato(
            fontSize: fontSize ?? 15.sp,
            fontWeight: FontWeight.w500,
            //color: darkTextColor,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
