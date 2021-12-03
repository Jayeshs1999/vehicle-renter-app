import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rentify_all/pages/categories.dart';
import 'package:rentify_all/pages/signup.dart';
import 'package:rentify_all/temporary/AdminLogin.dart';
import 'package:rentify_all/temporary/DashBoard.dart';
import 'package:rentify_all/temporary/DriverLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:custom_page_route/custom_page_route.dart';

class Login extends StatefulWidget {
  String uname;
  String uemail;
  Login({
    Key? key,
    required this.uname,
    required this.uemail,
  }) : super(key: key);

  @override
  _LoginState createState() =>
      _LoginState(uname: this.uname, uemail: this.uemail);
}

class _LoginState extends State<Login> {
  String uname, uemail;
  _LoginState({
    Key? key,
    required this.uname,
    required this.uemail,
  }) : super();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  //keep user sign in
  late SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    if (isLogedin == true) {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => HomePage()));
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => HomePage(
      //           name: uname,
      //           email: _emailTextController.text,
      //         )));

    }
    setState(() {
      loading = false;
    });
  }

  //========================google sign in method==============================

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = await GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final authResult = await firebaseAuth.signInWithCredential(credential);

    final User? user = authResult.user;

    if (user != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        //insert the user to our collection
        FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "id": user.uid,
          "username": user.email,
          "profilePicture": user.photoURL,
        });

        await preferences.setString("id", user.uid);
        await preferences.setString("username", (user.email).toString());
        await preferences.setString(
            "profilePicture", (user.displayName).toString());
      } else {
        await preferences.setString("id", documents[0]["id"]);
        await preferences.setString("username", documents[0]["username"]);
        await preferences.setString("photoUrl", documents[0]["profilePicture"]);
      }
      //----------------------------------------------------------------
      preferences.setString("email", user.email.toString());
      preferences.setString("name", user.displayName.toString());
      //----------------------------------------------------------------

      Fluttertoast.showToast(msg: "Login Successfull");
      setState(() {
        loading = false;
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => HomePage()));
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Categories(
              email: user.email.toString(), name: user.displayName.toString())
          // HomePage(
          //       name: uname,
          //       email: user.email.toString(),
          //     )
          ));
    } else {
      Fluttertoast.showToast(msg: "Login Failed !");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,

      // appBar: AppBar(
      //   title: Text(
      //     "Login",
      //   ),
      //   elevation: 0.1,
      // ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SizedBox(
            height: 700,
            width: 330,
            child: Card(
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.green,
              child: Stack(
                children: [
                  // Image.asset(
                  //   "images/splash_image/back.jpg",
                  //   fit: BoxFit.fill,
                  //   width: double.infinity,
                  //   height: double.infinity,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                        alignment: Alignment.topCenter,
                        child: Text("lets go",
                            style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Ephesis",
                                color: Colors.pinkAccent.shade100))
                        // child: Image.asset(
                        //   "images/letsgo.png",
                        //   width: 150.0,
                        //   height: 150.0,
                        // ),
                        ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 130.0, left: 120),
                      child: Image(
                        image: AssetImage(
                          "images/icon/login.png",
                        ),
                        height: 70,
                      )),
                  // Container(
                  //   color: Colors.black12,
                  //   width: double.infinity,
                  //   height: double.infinity,
                  // ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200.0),
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            children: <Widget>[
                              //email textbox===============================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black.withOpacity(0.05),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                    ),
                                    child: TextFormField(
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                      controller: _emailTextController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        icon: Icon(Icons.alternate_email),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex =
                                              new RegExp("${pattern}");
                                          if (!regex.hasMatch(value))
                                            return 'Please make sure your email address is valid';
                                          else
                                            return null;
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              //passworld textbox=========================================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.black.withOpacity(0.05),
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: TextFormField(
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                      obscureText: true,
                                      controller: _passwordTextController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        icon: Icon(Icons.lock_outline),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "The password field cannot be empty";
                                        } else if (value.length < 6) {
                                          return "the password has to be at least 6 characters long";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),

                              //button=================================================
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.blue.withOpacity(0.8),
                                    elevation: 0.0,
                                    child: MaterialButton(
                                      onPressed: () {
                                        sigIn(_emailTextController.text,
                                            _passwordTextController.text);
                                      },
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      child: Text("Login",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0,
                                          )),
                                    )),
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Forgot password",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) => SignUp()));
                                            Navigator.of(context).push(
                                                CustomPageRoute(
                                                    axisDirection:
                                                        AxisDirection.left,
                                                    transitionDuration:
                                                        Duration(
                                                            milliseconds: 700),
                                                    child: SignUp()));
                                          },
                                          child: Text(
                                            "Create an account",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.deepOrange),
                                          ))),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Divider(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Or",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Divider(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Expanded(
                                child: Container(),
                              ),

                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                                child: InkWell(
                                    onTap: () {
                                      handleSignIn();
                                    },
                                    child: Image.asset(
                                      "images/google.jpg",
                                      height: 100,
                                      width: 100,
                                    )),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminLogin()));
                                      },
                                      child: Text(
                                        "Admin Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DriverLogin()));
                                          },
                                          child: Text(
                                            "Driver Login",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.deepOrange),
                                          ))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: loading,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white.withOpacity(0.9),
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sigIn(String email, String password) async {
    preferences = await SharedPreferences.getInstance();
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                preferences.setString("email", email),
                // preferences.setString("email", uname),
                Fluttertoast.showToast(msg: "Login Successful"),
                //----------------------------------------------------------------
                // preferences.setString("name", uname),
                //----------------------------------------------------------------
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return Categories(email: email, name: uname);
                }))
                //  HomePage(
                //       name: uname,
                //       email: email,
                //     )))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}


