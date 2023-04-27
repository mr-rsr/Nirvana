import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nirvana/src/views/googleLogin.dart';
import 'package:nirvana/src/views/homePage.dart';
import 'package:nirvana/src/views/onBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int init = 0;

class _MyHomePageState extends State<MyHomePage> {
//initstate
  Future<int> getInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    init = prefs.getInt('initScreen') ?? 0;
    return init;
  }

  @override
  void initState() {
    getInit().then((value) {
      init = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return init == 0 ? const OnBoardingScreen() : const HomePage();
        } else if (snapshot.hasError) {
          return const Center(
              child: Center(child: Text('Something went wrong')));
        } else {
          debugPrint('Logout');
          return const GoogleLogin();
        }
      },
    ));
  }
}
