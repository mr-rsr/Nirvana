//homepage
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nirvana/src/components/bottomSheetOnBoard.dart';
import 'package:nirvana/src/components/musicCoverWidget.dart';
import 'package:nirvana/src/provider/themeProvider.dart';
import 'package:nirvana/src/res/assetsImages.dart';
import 'package:nirvana/src/res/colors.dart';
import 'package:nirvana/src/res/styles.dart';
import 'package:nirvana/src/views/profile.dart';
import 'package:nirvana/src/views/report.dart';
import 'package:provider/provider.dart';
import 'package:hidable/hidable.dart';

import '../models/adsHelper.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();

  int currentIndex = 0;
  void _updateIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      Home(scrollController: scrollController),
      Report(
        controller: scrollController,
      ),
      Profile(scrollController: scrollController),
    ];
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      bottomNavigationBar: Hidable(
        preferredWidgetSize: Size.fromHeight(60.h),
        controller: scrollController,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: buttonColor,
          currentIndex: currentIndex,
          selectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(const AssetImage(homeIcon), size: 30.sp),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.signal_cellular_alt_rounded, size: 30.sp),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined, size: 30.sp),
              label: 'Profile',
            ),
          ],
          onTap: _updateIndex,
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
