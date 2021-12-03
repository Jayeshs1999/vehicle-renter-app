import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rentify_all/pages/home.dart';
import 'package:rentify_all/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/users.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  //final UserServices _userServices = UserServices();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String gender = "male";
  String groupValue = "male";
  bool hidePass = true;
  bool loading = false;
  late SharedPreferences preferences;
  final GoogleSignIn googleSignIn = GoogleSignIn();

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
          "username": user.displayName,
          "profilePicture": user.photoURL,
        });

        await preferences.setString("id", user.uid);
        await preferences.setString("username", (user.displayName).toString());
        await preferences.setString(
            "profilePicture", (user.displayName).toString());
      } else {
        await preferences.setString("id", documents[0]["id"]);
        await preferences.setString("username", documents[0]["username"]);
        await preferences.setString("photoUrl", documents[0]["profilePicture"]);
      }
      await preferences.setString("name", _nameTextController.text);
      Fluttertoast.showToast(msg: "Login Successfull");
      setState(() {
        loading = false;
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => HomePage()));
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(
                name: _nameTextController.text,
                email: user.displayName.toString(),
              )));
    } else {
      Fluttertoast.showToast(msg: "Login Failed !");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Login",
      //   ),
      //   elevation: 0.1,
      // ),
      body: Container(
        child: Stack(
          children: [
            // Image.asset(
            //   "images/backgroud.jpeg",
            //   fit: BoxFit.fill,
            //   width: double.infinity,
            //   height: double.infinity,
            // ),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10, top: 50, bottom: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 20)
                      ]),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.topCenter,
                            child: Text("lets go",
                                style: TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ephesis",
                                    color: Colors.black54))),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.1),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _nameTextController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Full name",
                                    icon: Icon(Icons.person_outline),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "The name field cannot be empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        //email textbox===============================
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.1),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12.0,
                              ),
                              child: ListTile(
                                title: TextFormField(
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
                                      RegExp regex = new RegExp("${pattern}");
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
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: Colors.white),
                        //     // color: Colors.white.withOpacity(0.8),
                        //     child: Row(
                        //       children: <Widget>[
                        //         Expanded(
                        //           child: ListTile(
                        //             title: Text(
                        //               "male",
                        //               textAlign: TextAlign.end,
                        //               style: TextStyle(color: Colors.black54),
                        //             ),
                        //             trailing: Radio(
                        //                 value: "male",
                        //                 groupValue: groupValue,
                        //                 onChanged: (e) => valueChanged(e)),
                        //           ),
                        //         ),
                        //         Expanded(
                        //           child: ListTile(
                        //             title: Text(
                        //               "female",
                        //               textAlign: TextAlign.end,
                        //               style: TextStyle(color: Colors.black54),
                        //             ),
                        //             trailing: Radio(
                        //                 value: "female",
                        //                 groupValue: groupValue,
                        //                 onChanged: (e) => valueChanged(e)),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        //passworld textbox=========================================
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.1),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: hidePass,
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
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                    )),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.1),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Confirm password",
                                    icon: Icon(Icons.lock_outline),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "The password field cannot be empty";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    } else if (_passwordTextController.text !=
                                        value) {
                                      return "the passwords do not match";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                    )),
                              ),
                            ),
                          ),
                        ),

                        //button=================================================
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.deepOrange,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () async {
                                  validateForm();
                                  // Navigator.of(context).pushReplacement(
                                  //     MaterialPageRoute(
                                  //         builder: (context) => HomePage()));
                                  print("we hweefe--------------");
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text("Sign up",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0,
                                    )),
                              )),
                        ),

                        Padding(
                            padding: EdgeInsets.all(0.8),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Login(
                                        uname: _nameTextController.text,
                                        uemail: _emailTextController.text);
                                  }));
                                },
                                child: Text(
                                  "I already have an account",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 16,
                                  ),
                                ))),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
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
                                  "Or Sign up with",
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

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                    child: MaterialButton(
                                        onPressed: () {},
                                        child: Image.asset(
                                          "images/fl.png",
                                          width: 60,
                                        ))),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Material(
                                    child: MaterialButton(
                                        onPressed: () {
                                          handleSignIn();
                                        },
                                        child: Image.asset(
                                          "images/gl.png",
                                          width: 60,
                                        ))),
                              ),
                            ]),

                        // Divider(
                        //   color: Colors.white,
                        // ),
                        // Text(
                        //   "Other login option",
                        // ),

                        //google sign in option
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        //   child: Material(
                        //       borderRadius: BorderRadius.circular(20.0),
                        //       color: Colors.red.withOpacity(0.9),
                        //       elevation: 0.0,
                        //       child: MaterialButton(
                        //         onPressed: () {
                        //           handleSignIn();
                        //         },
                        //         minWidth: MediaQuery.of(context).size.width,
                        //         child: Text("Google",
                        //             textAlign: TextAlign.center,
                        //             style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 22.0,
                        //             )),
                        //       )),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Center(
            //     child: ElevatedButton(
            //   // color: Colors.red.shade100,
            //   onPressed: () {
            //     handleSignIn();
            //   },
            //   child: Text(
            //     "sign in/Sign up with google",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // )),
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
            )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //     child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child:
      //             // FlatButton(
      //             //   color: Colors.red.shade900,
      //             //   onPressed: () {
      //             //     handleSignIn();
      //             //   },
      //             //   child: Text(
      //             //     "sign in/Sign up with google",
      //             //     style: TextStyle(color: Colors.white),
      //             //   ),
      //             // ),
      //             GestureDetector(
      //           child: Image(
      //             image: AssetImage("images/google.png"),
      //             height: 70,
      //           ),
      //           onTap: () {},
      //         ))),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future validateForm() async {
    FormState? formState = _formKey.currentState;

    // print("up");
    if (formState!.validate()) {
      formState.reset();
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: _emailTextController.text,
              password: _passwordTextController.text)
          .then((value) => {postDetailsToFirebase()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }

    // FormState? formState = _formKey.currentState;

    // if (formState!.validate()) {
    //   formState.reset();

    // final _auth = FirebaseAuth.instance;
    // String email, password;
    // try {
    //   if (_auth == null) {
    //     UserCredential newUser = await _auth.createUserWithEmailAndPassword(
    //         email: _emailTextController.text,
    //         password: _passwordTextController.text);
    //     if (newUser != null) {
    //       Navigator.of(context).pushReplacement(
    //           MaterialPageRoute(builder: (context) => Login()));
    //     }
    //   }
    // } catch (e) {
    //   print(e);
    // }

    // print("jyjy");
    // User? user = await firebaseAuth.currentUser;
    // print("y");
    // // if (user == null) {
    // print("j");
    // firebaseAuth
    //     .createUserWithEmailAndPassword(
    //         email: _emailTextController.text,
    //         password: _passwordTextController.text)
    //     .then((user) => {
    //           _userServices.createUser({
    //             "username": _nameTextController.text,
    //             "email": _emailTextController.text,
    //             //   "userId": user.user!.uid,
    //             "gender": gender,
    //           }),
    //         })
    //     .catchError((e) => print(e.toString()));
    // print("heee");
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    // //}
  }

  postDetailsToFirebase() async {
    // final firebaseRef = FirebaseDatabase(
    //         databaseURL: "https://rentifyall-app-default-rtdb.firebaseio.com/")
    //     .reference()
    //     .child("users");
    final _auth = FirebaseAuth.instance;

    final FirebaseDatabase _database = FirebaseDatabase.instance;

    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.gender = gender;
    userModel.firstName = _nameTextController.text;
    userModel.password = _passwordTextController.text;

    _database.reference().child("Users").push().set(userModel.toMap());

    // await firebaseFirestore
    //     .collection("users")
    //     .doc(user.uid)
    //     .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account create successfully :)");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => Login(
                  uname: _nameTextController.text,
                  uemail: _emailTextController.text,
                )),
        (route) => false);
  }
}


//----------------------------------------------------------------------------------------
// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// //import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:rentify_all/common/loading.dart';
// import 'package:rentify_all/provider.dart';
// import '../db/users.dart';
// import 'home.dart';

// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final _formKey = GlobalKey<FormState>();
//   final _key = GlobalKey<ScaffoldState>();

//   TextEditingController _email = TextEditingController();
//   TextEditingController _password = TextEditingController();
//   TextEditingController _name = TextEditingController();
//   bool hidePass = true;

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context);

//     return Scaffold(
//       key: _key,
//       body: user.status == Status.Authenticating
//           ? Loading()
//           : Stack(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(16),
//                       boxShadow: [
//                         BoxShadow(
//                           //    color: Colors.grey[350],
//                           blurRadius:
//                               20.0, // has the effect of softening the shadow
//                         )
//                       ],
//                     ),
//                     child: Form(
//                         key: _formKey,
//                         child: ListView(
//                           children: <Widget>[
//                             SizedBox(
//                               height: 40,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Container(
//                                 alignment: Alignment.topCenter,
//                                 // child: SvgPicture.asset(
//                                 //   'images/signup.svg',
//                                 //   width: 200.0,
//                                 // )
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(
//                                   14.0, 8.0, 14.0, 8.0),
//                               child: Material(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 color: Colors.grey.withOpacity(0.2),
//                                 elevation: 0.0,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 12.0),
//                                   child: ListTile(
//                                     title: TextFormField(
//                                       controller: _name,
//                                       decoration: InputDecoration(
//                                           hintText: "Full name",
//                                           icon: Icon(Icons.person_outline),
//                                           border: InputBorder.none),
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return "The name field cannot be empty";
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(
//                                   14.0, 8.0, 14.0, 8.0),
//                               child: Material(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 color: Colors.grey.withOpacity(0.2),
//                                 elevation: 0.0,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 12.0),
//                                   child: ListTile(
//                                     title: TextFormField(
//                                       controller: _email,
//                                       decoration: InputDecoration(
//                                           hintText: "Email",
//                                           icon: Icon(Icons.alternate_email),
//                                           border: InputBorder.none),
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           Pattern pattern =
//                                               r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                                           RegExp regex =
//                                               new RegExp("${pattern}");
//                                           if (!regex.hasMatch(value))
//                                             return 'Please make sure your email address is valid';
//                                           else
//                                             return null;
//                                         }
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(
//                                   14.0, 8.0, 14.0, 8.0),
//                               child: Material(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 color: Colors.grey.withOpacity(0.2),
//                                 elevation: 0.0,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 12.0),
//                                   child: ListTile(
//                                     title: TextFormField(
//                                       controller: _password,
//                                       obscureText: hidePass,
//                                       decoration: InputDecoration(
//                                           hintText: "Password",
//                                           icon: Icon(Icons.lock_outline),
//                                           border: InputBorder.none),
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return "The password field cannot be empty";
//                                         } else if (value.length < 6) {
//                                           return "the password has to be at least 6 characters long";
//                                         }
//                                         return null;
//                                       },
//                                     ),
//                                     trailing: IconButton(
//                                         icon: Icon(Icons.remove_red_eye),
//                                         onPressed: () {
//                                           setState(() {
//                                             hidePass = false;
//                                           });
//                                         }),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(
//                                   14.0, 8.0, 14.0, 8.0),
//                               child: Material(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   color: Colors.black,
//                                   elevation: 0.0,
//                                   child: MaterialButton(
//                                     onPressed: () async {
//                                       if (_formKey.currentState!.validate()) {
//                                         if (!await user.signUp(_name.text,
//                                             _email.text, _password.text)) {
//                                           _key.currentState!.showSnackBar(
//                                               SnackBar(
//                                                   content:
//                                                       Text("Sign up failed")));
//                                           return;
//                                         }
//                                         // changeScreenReplacement(
//                                         //     context, HomePage());
//                                       }
//                                     },
//                                     minWidth: MediaQuery.of(context).size.width,
//                                     child: Text(
//                                       "Sign up",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20.0),
//                                     ),
//                                   )),
//                             ),
//                             Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: InkWell(
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: Text(
//                                       "I already have an account",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.black, fontSize: 16),
//                                     ))),
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Or sign up with",
//                                       style: TextStyle(
//                                           fontSize: 18, color: Colors.grey),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.fromLTRB(
//                                         14.0, 8.0, 14.0, 8.0),
//                                     child: Material(
//                                         child: MaterialButton(
//                                             onPressed: () async {},
//                                             child: Image.asset(
//                                               "images/ggg.png",
//                                               width: 30,
//                                             ))),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
