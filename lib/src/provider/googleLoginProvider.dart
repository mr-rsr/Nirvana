import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/showLoading.dart';

final showdialog = LoadingDialogBox();

class GoogleSigninProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin(BuildContext context) async {
    showdialog.showDialogBox(context, ' Loading');

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    notifyListeners();
  }

  final loading = LoadingDialogBox();
  Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('initScreen', 0);

    await googleSignIn.disconnect();

    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  @override
  notifyListeners();
}
