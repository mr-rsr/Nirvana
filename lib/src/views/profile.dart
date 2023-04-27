import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nirvana/src/components/setReminderBottomSheet.dart';
import 'package:nirvana/src/components/showLoading.dart';
import 'package:nirvana/src/provider/themeProvider.dart';
import 'package:nirvana/src/res/assetsImages.dart';
import 'package:nirvana/src/res/colors.dart';
import 'package:nirvana/src/res/dimens.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:nirvana/src/views/googleLogin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/googleLoginProvider.dart';
import '../res/styles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _darkTheme = false;
  final loading = LoadingDialogBox();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final User? user = FirebaseAuth.instance.currentUser;
    _darkTheme = themeProvider.getDarkMode;
    debugPrint(_darkTheme.toString());
    return SizedBox(
      width: double.infinity,
      child:  NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
        child: ListView(
          controller: widget.scrollController,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                right: 20.w,
                left: 20.w,
              ),
              child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.r,
                        backgroundImage: NetworkImage(
                          user!.photoURL.toString(),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            user.displayName.toString(),
                            style: GoogleFonts.lato(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Row(
                            //textBaseline: TextBaseline.alphabetic,
                            //mainAxisAlignment: MainAxisAlignment.,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  user.email.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    color: const Color(0xffAFAFAF),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SizedBox(
                                width: 15.w,
                                height: 15.h,
                                child: const Image(
                                  image: AssetImage(googleLogo),
                                ),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 25.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: _darkTheme
                                    ? const Color(0xff4F445C)
                                    : const Color(0xffF5EDFF),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 15.h,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            //divider
            Divider(
              color:
                  _darkTheme ? const Color(0xff575757) : const Color(0xffEEEEEE),
              thickness: 1.h,
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 8.h),
              child: Text(
                'Settings',
                style: GoogleFonts.lato(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
      
            Tiles(
              leading: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: const Color(0xffEFE2FF),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(11.0.r),
                  child: const ImageIcon(
                    AssetImage(darkThemeLogo),
                    color: Color(0xff5A5490),
                  ),
                ),
              ),
              title: Text(
                'Dark Mode',
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Switch(
                value: _darkTheme,
                onChanged: (value) {
                  setState(() {
                    _darkTheme = value;
                    onThemeChanged(_darkTheme, themeProvider);
                  });
                },
                activeColor: const Color(0xff4F445C),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                    enableDrag: false,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      // <-- SEE HERE
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return SetReminder(darkMode: _darkTheme);
                    });
              },
              child: Tiles(
                  leading: Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFE8E8),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Icon(
                        Icons.notifications,
                        color: const Color(0xffEA6C6C),
                        size: 30.sp,
                      ),
                    ),
                  ),
                  title: Text(
                    'Reminder',
                    style: GoogleFonts.lato(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 8.0.h),
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 28.sp,
                      color: const Color(0xffACAEB5),
                    ),
                  )),
            ),
            SizedBox(
              height: 5.h,
            ),
            Tiles(
              title: Text('Share',
                  style: GoogleFonts.lato(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  )),
              leading: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: const Color(0xffE0EDFF),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(11.0.r),
                  child: const ImageIcon(
                    AssetImage(shareLogo),
                    color: Color(0xff4C63B8),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Divider(
              color:
                  _darkTheme ? const Color(0xff575757) : const Color(0xffEEEEEE),
              thickness: 1.h,
              height: 1.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            Tiles(
              title: Text(
                'Help',
                style: GoogleFonts.lato(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18.h,
              ),
            ),
            Tiles(
              title: Text(
                'Terms and Conditions',
                style: GoogleFonts.lato(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18.h,
              ),
            ),
            Tiles(
              title: Text(
                'Privacy Policy',
                style: GoogleFonts.lato(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18.h,
              ),
            ),
            Tiles(
              title: Text(
                'Rate Us',
                style: GoogleFonts.lato(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18.h,
              ),
            ),
            InkWell(
              onTap: () {
                showDialogBox(
                    context, 'Are you sure you want to log out?', Icons.logout);
              },
              child: Tiles(
                title: Text(
                  'Log Out',
                  style: GoogleFonts.lato(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 18.h,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }

  showDialogBox(BuildContext context, String message, IconData prefixIcon) {
    final googleSigndata =
        Provider.of<GoogleSigninProvider>(context, listen: false);
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: SizedBox(
              width: 350.w,
              child: AlertDialog(
                insetPadding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                icon: Text(
                  "Log Out?",
                  style: GoogleFonts.lato(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Builder(builder: (context) {
                  return SizedBox(
                    width: 260.w,
                    height: 20.h,
                    child: Text(
                      message,
                      style: GoogleFonts.lato(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }),
                actions: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 25.0.h, left: 8.w, right: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 36.h,
                          width: 130.w,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: buttonColor,
                                side: BorderSide(
                                  color: buttonColor,
                                  width: 1.w,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.lato(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                          width: 130.w,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                foregroundColor: darkTextColor,
                                backgroundColor: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigator.pop(context);
                              //loading.showDialogBox(context, 'Logging out');
                              googleSigndata.logout();

                              // ignore: use_build_context_synchronously
                            },
                            child: Text(
                              "Log Out",
                              style: GoogleFonts.lato(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void onThemeChanged(bool value, ThemeProvider themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme, true)
        : themeNotifier.setTheme(lightTheme, false);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(dark, value);
  }
}

class Tiles extends StatelessWidget {
  const Tiles({
    this.leading,
    required this.title,
    this.trailing,
    super.key,
  });
  final Widget? leading;
  final Widget title;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.h,
      child: Center(
        child: ListTile(
          title: title,
          leading: leading,
          trailing: trailing,
        ),
      ),
    );
  }
}
