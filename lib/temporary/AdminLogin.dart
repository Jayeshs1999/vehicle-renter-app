import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rentify_all/temporary/DashBoard.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 40,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 60.0),
                              child: Text("Admin",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ephesis",
                                      color: Colors.pinkAccent.shade100)),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 80.0, left: 105),
                      child: Image(
                        image: AssetImage(
                          "images/icon/admin.png",
                        ),
                        height: 120,
                      )),
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
                                        hintText: "Admin Email",
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
                                        hintText: "Admin Password",
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
                                        _login();
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
                            ],
                          ),
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

  Future _login() async {
    if (_emailTextController.text == "Admin" &&
        _passwordTextController.text == "Pass@123") {
      Fluttertoast.showToast(msg: "Login Successfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
    } else {
      Fluttertoast.showToast(msg: "Enter Valid User and Password");
    }
  }
}
