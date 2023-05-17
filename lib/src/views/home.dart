import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/components/bannerAds.dart';
import 'package:nirvana/src/components/homePageBox.dart';
import 'package:nirvana/src/views/songListScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/musicCoverWidget.dart';
import '../provider/themeProvider.dart';
import '../res/assetsImages.dart';
import '../res/colors.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(
      //fit: StackFit.expand,
      children: [
        Positioned.fill(
          top: 0,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: ListView(
              controller: scrollController,
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 200.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    //color: buttonColor,
                    image: DecorationImage(
                      // image: image1,
                      image: AssetImage(themeProvider.getDarkMode
                          ? homePageBanner2
                          : homePageBanner),
                      fit: BoxFit.fill,
                    ),
                    //borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
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
                          Text(
                            'Nirvana',
                            style: GoogleFonts.mukta(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              //color: darkTextColor,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomePageBox(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SongListScreen(),
                                ),
                              );
                            },
                            image: Positioned(
                              right: -1.5,
                              bottom: 12.h,
                              child: Image(
                                image: const AssetImage(boxMusic),
                                height: 50.h,
                                width: 60.h,
                              ),
                            ),
                            text: 'Music',
                            textColor: const Color(0xff325484),
                            boxColor: const Color(0xffEBF3FF),
                          ),
                          HomePageBox(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SongListScreen(),
                                  ),
                                );
                              },
                              image: Positioned(
                                right: 0,
                                bottom: 0.h,
                                child: Image(
                                  image: const AssetImage(boxSpiritual),
                                  height: 50.h,
                                  width: 60.h,
                                ),
                              ),
                              text: 'classic',
                              textColor: const Color(0xff2B265B),
                              boxColor: const Color(0xffFFE9E9)),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomePageBox(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SongListScreen(),
                                ),
                              );
                            },
                            image: Positioned(
                              right: -4,
                              bottom: 0.h,
                              child: Image(
                                image: const AssetImage(boxNature),
                                height: 60.h,
                                width: 70.h,
                              ),
                            ),
                            text: 'Nature',
                            textColor: const Color(0xff325484),
                            boxColor: const Color(0xffDCF0E7),
                          ),
                          HomePageBox(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SongListScreen(),
                                  ),
                                );
                              },
                              image: Positioned(
                                right: 0,
                                bottom: 0.h,
                                child: Image(
                                  image: const AssetImage(boxSpiritual),
                                  height: 50.h,
                                  width: 60.h,
                                ),
                              ),
                              text: 'Spiritual',
                              textColor: const Color(0xff2B265B),
                              boxColor: const Color(0xffFFE9E9)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text('Recommendations',
                      style: GoogleFonts.lato(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        //color: darkTextColor,
                        decoration: TextDecoration.none,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 180.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const MusicCoverWidget(
                          image: AssetImage(recommendation),
                          text: 'Calm your mind',
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        const MusicCoverWidget(
                          image: AssetImage(recommendation),
                          text: 'Calm your mind',
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        const MusicCoverWidget(
                          image: AssetImage(recommendation),
                          text: 'Calm your mind',
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        const MusicCoverWidget(
                          image: AssetImage(recommendation),
                          text: 'Calm your mind',
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 20.w),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 180.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 295.w,
                          height: 144.h,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Container(
                          width: 295.w,
                          height: 144.h,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Container(
                          width: 295.w,
                          height: 144.h,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Container(
                          width: 295.w,
                          height: 144.h,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
        ),
        const Positioned(bottom: 0, left: 0, right: 0, child: BottomAds()),
      ],
    );
  }
}
