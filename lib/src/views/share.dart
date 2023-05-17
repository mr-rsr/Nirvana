import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/res/assetsImages.dart';

class Share extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        // share8ei (1:2)
        padding: EdgeInsets.fromLTRB(25, 33, 0, 38),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff232930),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff393e44),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(6, 0, 0, 160),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 60, 900, 0),
                    width: 309,
                    height: 325,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                                meditiate,
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
                                streak,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 101,
                          top: 152,
                          child: Align(
                            child: SizedBox(
                              width: 108,
                              height: 22,
                              child: Text(
                                'Mindful Days',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
                                  decoration: TextDecoration.none,
                                ),
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Color(0xffffffff),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 116.5,
                          top: 236,
                          child: Align(
                            child: SizedBox(
                              width: 75,
                              height: 15,
                              child: Text(
                                'Total Sessions',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Color(0xffffffff),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 218,
                          top: 236,
                          child: Align(
                            child: SizedBox(
                              width: 74,
                              height: 15,
                              child: Text(
                                'Total Minutes',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Color(0xffffffff),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 45,
                          top: 257,
                          child: Align(
                            child: SizedBox(
                              width: 12,
                              height: 24,
                              child: Text(
                                '0',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: const Color(0xffffffff),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 145,
                          top: 257,
                          child: Align(
                            child: SizedBox(
                              width: 12,
                              height: 24,
                              child: Text(
                                '0',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Color(0xffffffff),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 248,
                          top: 257,
                          child: Align(
                            child: SizedBox(
                              width: 12,
                              height: 24,
                              child: Text(
                                '0',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                  color: Color(0xffffffff),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 41,
                          top: 207,
                          child: Align(
                            child: SizedBox(
                              width: 26,
                              height: 16,
                              child: Image.asset(
                                vector,
                                width: 26,
                                height: 16,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 145,
                          top: 203,
                          child: Align(
                            child: SizedBox(
                              width: 22,
                              height: 20,
                              child: Image.asset(
                                mind,
                                width: 22,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 246,
                          top: 203,
                          child: Align(
                            child: SizedBox(
                              width: 18,
                              height: 20,
                              child: Image.asset(
                                clock,
                                width: 18,
                                height: 20,
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
                                  color: Color(0xffffffff),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 329,
                    height: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffe5e5e5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group18677tKg (1:6)
              margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
              padding: EdgeInsets.fromLTRB(103, 8, 109.5, 13),
              width: 300,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xffbb86fc),
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
                      margin: EdgeInsets.fromLTRB(0, 0, 15.5, 0),
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        icon,
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
                        color: Color(0xffffffff),
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
    );
  }
}
