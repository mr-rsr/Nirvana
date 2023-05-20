import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/res/assetsImages.dart';
import 'dart:ui' as ui;
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

import 'package:share/share.dart';

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey globalKey = GlobalKey();

    Future<Uint8List?> _captureImage(GlobalKey globalKey) async {
      try {
        RenderRepaintBoundary boundary = globalKey.currentContext!
            .findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        return byteData?.buffer.asUint8List();
      } catch (e) {
        print(e);
      }
      return null;
    }

    Future<void> _shareImage(GlobalKey globalKey) async {
      try {
        Uint8List? imageBytes = await _captureImage(globalKey);
        if (imageBytes != null) {
          final tempDir = await getTemporaryDirectory();
          final file = await File('${tempDir.path}/image.png').create();
          await file.writeAsBytes(imageBytes);
          await Share.shareFiles([file.path]);
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 1606.h,
            left: -602.w,
            child: Container(
              height: 812.h,
              width: 375.w,
              decoration: BoxDecoration(
                color: const Color(0xFF232930),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF393E44),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Positioned(
                      top: 9.h,
                      left: 7.w,
                      child: Image.asset(
                        cut,
                        width: 14,
                        height: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: RepaintBoundary(
                  key: globalKey,
                  child: Container(
                    height: 325.h,
                    width: 309.w,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(187, 134, 252, 0.6),
                          Color.fromRGBO(173, 87, 152, 0.797039),
                          Color(0xFF2B265B),
                        ],
                        stops: [0, 0.5312, 1],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(meditiate),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 39),
                              child: Image.asset(
                                streak,
                                height: 104.h,
                                width: 104.w,
                              ),
                            ),
                            Positioned(
                              top: 78.h,
                              left: 40.w,
                              child: Text(
                                '30',
                                style: GoogleFonts.lato(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                  color: const Color(0xFFFFFFFF),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            'Mindful Days',
                            style: GoogleFonts.lato(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                              color: const Color(0xFFFFFFFF),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      Vector,
                                      height: 20,
                                      width: 26,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 13),
                                      child: Text(
                                        'Longest Streak',
                                        style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2.h,
                                          color: const Color(0xFFFFFFFF),
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '0',
                                      style: GoogleFonts.lato(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2,
                                        color: const Color(0xFFFFFFFF),
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      mind,
                                      height: 20,
                                      width: 22,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 13),
                                      child: Text(
                                        'Total Session',
                                        style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2,
                                          color: const Color(0xFFFFFFFF),
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '0',
                                      style: GoogleFonts.lato(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2,
                                        color: const Color(0xFFFFFFFF),
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      clock,
                                      height: 20,
                                      width: 18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 13),
                                      child: Text(
                                        'Total Minutes',
                                        style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2,
                                          color: const Color(0xFFFFFFFF),
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '0',
                                      style: GoogleFonts.lato(
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2,
                                        color: const Color(0xFFFFFFFF),
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.w, top: 90),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        _shareImage(globalKey);
                      },
                      child: Container(
                        height: 45.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFBB86FC),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              icon,
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Share',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                                color: const Color(0xFFFFFFFF),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
