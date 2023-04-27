import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nirvana/src/res/assetsImages.dart';
import 'package:nirvana/src/views/onBoarding.dart';
import 'package:provider/provider.dart';
import '../provider/googleLoginProvider.dart';
import '../res/colors.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Once');
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(),
            Column(
              children: [
                Image(
                  height: 215.h,
                  width: 189.w,
                  image: const AssetImage(googleLogin),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Welcome to Nirvana",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: lightTextColor,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w, right: 40.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Customize your interface. It will help you to",
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: lightTextColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "comfort your eyes.",
                        style: GoogleFonts.lato(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: lightTextColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 95.h),
              child: SizedBox(
                height: 46.h,
                width: 256.w,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSigninProvider>(context,
                        listen: false);
                    provider.googleLogin(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 25.h,
                        width: 25.h,
                        image: AssetImage(googleLogo),
                      ),
                      SizedBox(
                        width: 13.w,
                      ),
                      Text(
                        "Sign in with Google",
                        style: GoogleFonts.lato(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: lightTextColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
