import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.fromLTRB(25, 33, 0, 38),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff232930),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 115),
              width: 30 * fem,
              height: 30 * fem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff393e44),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 0, 160),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 66, 936, 0),
                    width: 309,
                    height: 325,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20 * fem),
                      gradient: const LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[
                          Color(0x99bb86fc),
                          Color(0xcbac5698),
                          Color(0xff2b255b)
                        ],
                        stops: <double>[0, 0.531, 1],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 4,
                          top: 3,
                          child: Align(
                            child: SizedBox(
                              width: 300,
                              height: 318.63,
                              child: Image.asset(
                                'assets/page-1/images/sl0510225028034-converted-1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 102,
                          top: 42,
                          child: Align(
                            child: SizedBox(
                              width: 104,
                              height: 104,
                              child: Image.asset(
                                'assets/page-1/images/streaks2-removebg-preview-1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 14,
                          top: 236,
                          child: Align(
                            child: SizedBox(
                              width: 80,
                              height: 15,
                              child: Text(
                                'Longest Streak',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 12 ,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2 ,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 101,
                          top: 152 ,
                          child: Align(
                            child: SizedBox(
                              width: 108 ,
                              height: 22 ,
                              child: Text(
                                'Mindful Days',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2 ,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // r4E (1:15)
                          left: 45 * fem,
                          top: 257 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 12 ,
                              height: 24 ,
                              child: Text(
                                '0',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // j82 (1:16)
                          left: 145 ,
                          top: 257 ,
                          child: Align(
                            child: SizedBox(
                              width: 12,
                              height: 24,
                              child: Text(
                                '0',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 20 ,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2 ,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // Dot (1:17)
                          left: 248 ,
                          top: 257 ,
                          child: Align(
                            child: SizedBox(
                              width: 12 ,
                              height: 24 ,
                              child: Text(
                                '0',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 20 ,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // totalsessionsXpa (1:18)
                          left: 116.5 ,
                          top: 236 ,
                          child: Align(
                            child: SizedBox(
                              width: 75 ,
                              height: 15 ,
                              child: Text(
                                'Total Sessions',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 12 ,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2 ,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // totalminutes32E (1:19)
                          left: 218,
                          top: 236 ,
                          child: Align(
                            child: SizedBox(
                              width: 74 ,
                              height: 15 ,
                              child: Text(
                                'Total Minutes',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 12 ,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2 ,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 41 ,
                          top: 207 ,
                          child: Align(
                            child: SizedBox(
                              width: 26 ,
                              height: 16 ,
                              child: Image.asset(
                                'assets/page-1/images/vector-YYE.png',
                                width: 26 ,
                                height: 16 ,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 145,
                          top: 203 ,
                          child: Align(
                            child: SizedBox(
                              width: 22 ,
                              height: 20,
                              child: Image.asset(
                                'assets/page-1/images/vector.png',
                                width: 22,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // vectork54 (1:22)
                          left: 246 ,
                          top: 203 ,
                          child: Align(
                            child: SizedBox(
                              width: 18 ,
                              height: 20 ,
                              child: Image.asset(
                                'assets/page-1/images/vector-9o4.png',
                                width: 18 ,
                                height: 20 ,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 139,
                          top: 81,
                          child: Align(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Text(
                                '30',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // rectangle266wfL (1:3)
                    width: 329 * fem,
                    height: 115 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20 * fem),
                      color: const Color(0xffe5e5e5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group18677tKg (1:6)
              margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
              padding: const EdgeInsets.fromLTRB(103, 8, 109.5, 13),
              width: 300,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xffbb86fc),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                // group18676ayC (1:8)
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // vector8Uv (1:9)
                      margin: const EdgeInsets.fromLTRB(0, 0, 15.5, 0),
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'assets/page-1/images/vector-eMU.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Text(
                      'Share',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
