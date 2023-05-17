import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nirvana/src/provider/googleLoginProvider.dart';
import 'package:nirvana/src/provider/themeProvider.dart';
import 'package:nirvana/src/res/colors.dart';
import 'package:nirvana/src/res/styles.dart';
import 'package:nirvana/src/views/homePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nirvana/src/views/splashScreen.dart';
import 'package:provider/provider.dart';
import 'package:nirvana/src/views/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool(dark) ?? false;
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeProvider>(
                create: (_) => ThemeProvider(
                    darkModeOn ? darkTheme : lightTheme, darkModeOn)),
            ChangeNotifierProvider(create: (_) => GoogleSigninProvider())
          ],
          child: const MyApp(),
        ),
      );
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //print width

    final themeProvider = Provider.of<ThemeProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nirvana',
        theme: themeProvider.getTheme,
        home: Share(),
      ),
    );
  }
}

