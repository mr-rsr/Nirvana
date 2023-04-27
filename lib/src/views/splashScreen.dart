import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvana/src/provider/themeProvider.dart';
import 'package:nirvana/src/views/googleLogin.dart';
import 'package:nirvana/src/views/index.dart';
import 'package:nirvana/src/views/homePage.dart';
import 'package:nirvana/src/views/onBoarding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/assetsImages.dart';
import '../res/colors.dart';

var init = 0;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<int> getInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    init = prefs.getInt('init') ?? 0;
    return init;
  }

  @override
  void initState() {
    super.initState();
    // getInit().then((value) {
    //   init = value;
    // });
    User? user = FirebaseAuth.instance.currentUser;
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage())));
  }

// StreamBuilder(
//                       stream: FirebaseAuth.instance.authStateChanges(),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const Center(
//                               child: CircularProgressIndicator());
//                         } else if (snapshot.hasData) {
//                           return init == 0
//                               ? const OnBoardingScreen()
//                               : const HomePage();
//                         } else if (snapshot.hasError) {
//                           return const Center(
//                               child:
//                                   Center(child: Text('Something went wrong')));
//                         } else {
//                           return const GoogleLogin();
//                         }
//                       },
//                     )))

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? false;
    });
    return Container(
      color: splashBgColor,
      child: Center(
        child: Image(
          height: 64.h,
          width: 64.w,
          image: const AssetImage(splashImage),
        ),
      ),
    );
  }
}
