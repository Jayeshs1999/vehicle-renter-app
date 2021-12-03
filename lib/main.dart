import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentify_all/app_provider.dart';
import 'package:rentify_all/pages/categories.dart';
//import 'package:provider/provider.dart';
//import 'package:rentify_all/components/products.dart';
import 'package:rentify_all/pages/home.dart';
import 'package:rentify_all/pages/login.dart';
import 'package:rentify_all/pages/reglog.dart';
import 'package:rentify_all/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:rentify_all/controllers/login_controller.dart';

//import 'package:rentify_all/pages/login.dart';

void main() async {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  var name = preferences.getString('name');
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AppProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Hello",
          home: SplashScreen())));

  //  MyApp());
}
