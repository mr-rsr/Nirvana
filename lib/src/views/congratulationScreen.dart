import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/res/assetsImages.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import '../res/colors.dart';

// ignore: must_be_immutable
class CongratulationScreen extends StatelessWidget {
  CongratulationScreen({super.key, required this.title});
  final String title;
  GlobalKey globalKey = GlobalKey();

  Future<Uint8List?> _captureImage() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> _shareImage(Uint8List imageBytes) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(imageBytes);
      await Share.shareFiles([file.path]);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Congratulation",
                    style: GoogleFonts.lato(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: lightTextColor,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 25.h,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffF3F1FF),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                        size: 20.h,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Your have completed your daily target 10min.",
                        softWrap: true,
                        style: GoogleFonts.lato(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffAFAFAF),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              RepaintBoundary(
                key: globalKey,
                child: Container(
                  width: 335.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff4C477A),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 30.h,
                        left: 30.w,
                        child: SizedBox(
                          width: 200.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Meditated spend for $title minute",
                                  softWrap: true,
                                  style: GoogleFonts.lato(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 63.h,
                        left: 30.w,
                        child: GestureDetector(
                          onTap: () async {
                            final image = await _captureImage();
                            if (image != null) {
                              await _shareImage(image);
                            }
                          },
                          child: Container(
                            width: 75.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Center(
                              child: Text(
                                'Share',
                                style: GoogleFonts.lato(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10.h,
                        right: 10.w,
                        child: const Image(
                          image: AssetImage(meditation),
                          width: 100,
                          height: 200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //text 'How are you feeling today?'
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How are you feeling ?",
                    softWrap: true,
                    style: GoogleFonts.lato(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: lightTextColor,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              //emoji row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildEmoji(const AssetImage(sad), 'Sad'),
                  buildEmoji(const AssetImage(worried), 'Worried'),
                  buildEmoji(const AssetImage(calm), 'Calm'),
                  buildEmoji(const AssetImage(tired), 'Tired'),
                  buildEmoji(const AssetImage(happy), 'Happy'),
                ],
              ),
              SizedBox(
                height: 95.h,
              ),
              //textButton
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(foregroundColor: buttonColor
                    //backgroundColor: buttonColor,
                    ),
                child: Text(
                  'Back to home',
                  style: GoogleFonts.lato(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: buttonColor,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildEmoji(ImageProvider img, String text) {
    return Column(
      children: [
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Center(
            child: Image(
              image: img,
              width: 30.w,
              height: 30.h,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: GoogleFonts.lato(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: lightTextColor,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
