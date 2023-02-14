import 'package:flutter/material.dart';
//Landing
import "package:flutter_application_1/screens/Landing/landing.dart";
import 'package:flutter_application_1/screens/Landing/login_form.dart';
import "package:flutter_application_1/screens/Landing/onboarding.dart";
import "package:flutter_application_1/screens/Landing/register_form.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // eliminar banda 'debug' borde sup
      title: 'Material app',

      // home: homeScreen(),
      routes: {
        "/": (context) => const Landing(),
        "/register": (context) => FormScreen(),
        "/onboarding": (context) => const OnBoarding(),
        "/login": (context) => LoginScreen(),
      },
    );
  }
}
