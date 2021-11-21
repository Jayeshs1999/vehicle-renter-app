import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController with ChangeNotifier {
  //object
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  //function for login
  login() async {
    this.googleSignInAccount = await _googleSignIn.signIn();

    //call
    notifyListeners();
  }

  //function to logout
  logOut() async {
    //empty the value after logOut

    this.googleSignInAccount = await _googleSignIn.signOut();

    notifyListeners();
  }
}
