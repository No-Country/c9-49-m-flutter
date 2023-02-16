import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_application_1/screens/home_screen.dart';

// SCREENS:
import "./screens/Onboarding/intro_screen.dart";
import "./screens/Onboarding/onboarding_screen.dart";
import "./screens/Home/home_screen.dart";
import "./screens/Authentication/login_screen.dart";
import "./screens/Authentication/register_screen.dart";



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // eliminar banda 'debug' borde sup
      title: 'Material app',

      // home: homeScreen(),
      routes: {
        "/": (context) => const IntroScreen(),
        "/home": (context) => const HomeScreen(),
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        // "/register": (context) => RegisterScreen(),
      },
    );
  }
}
