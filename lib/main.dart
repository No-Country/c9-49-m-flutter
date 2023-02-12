import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
//Landing
import "package:flutter_application_1/screens/Landing/landing.dart";
import 'package:flutter_application_1/screens/Landing/login_form.dart';
import "package:flutter_application_1/screens/Landing/onboarding.dart";
import "package:flutter_application_1/screens/Landing/register_form.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // eliminar banda 'debug' borde sup
      title: 'Material app',

      home: homeScreen(),
      // routes: {
      //   "/": (context) => Lading(),
      //   "/register": (context) => FormScreen(),
      //   "/onboarding": (context) => OnBoarding(),
      //   "/login": (context) => LoginScreen(),
      // },
    );
  }
}
