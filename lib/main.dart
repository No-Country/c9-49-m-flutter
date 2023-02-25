import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// SCREENS:
import "./screens/Onboarding/intro_screen.dart";
import "./screens/Onboarding/onboarding_screen.dart";
import "./screens/Onboarding/user_settings.dart";
import "./screens/Home/home_screen.dart";
import "./screens/Authentication/login_screen.dart";
import "./screens/Authentication/register_screen.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyCgbvaQflUG-Vw7iK_11MI0HfoNSo7a6s4",
      projectId: "speak-easy-no-country-c78ba",
      messagingSenderId: "1062828650314",
      appId: "1:1062828650314:web:c6dee7dbf7b98412bb9bb3",
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // eliminar banda 'debug' borde sup
      title: 'SpeakEasy',
      navigatorKey: MyFormWidget.navigatorKey,
      routes: {
        "/": (context) => const IntroScreen(),
        "/home": (context) => const HomeScreen(),
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/userpreferences": (context) => const MyFormWidget()
      },
    );
  }
}
