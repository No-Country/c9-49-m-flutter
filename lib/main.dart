import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter_application_1/screens/ConnectProfile/ConnectProfile.dart";
import "package:stream_chat_flutter/stream_chat_flutter.dart";
import 'package:flutter/foundation.dart' show kIsWeb;

// SCREENS:
import "./screens/Onboarding/intro_screen.dart";
import "./screens/Onboarding/onboarding_screen.dart";
import "./screens/Onboarding/user_settings.dart";
import "./screens/Authentication/login_screen.dart";
import "./screens/Authentication/register_screen.dart";

// Theme:
import './theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCgbvaQflUG-Vw7iK_11MI0HfoNSo7a6s4",
            projectId: "speak-easy-no-country-c78ba",
            messagingSenderId: "1062828650314",
            appId: "1:1062828650314:web:c6dee7dbf7b98412bb9bb3",
            storageBucket: 'speak-easy-no-country-c78ba.appspot.com'));
  } else {
    await Firebase.initializeApp();
  }
  final client = StreamChatClient(
    'qsu5mx4mgzxy',
    logLevel: Level.INFO,
  );

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.client});

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false, // eliminar banda 'debug' borde sup
      title: 'SpeakEasy',
      navigatorKey: MyFormWidget.navigatorKey,
      routes: {
        "/": (context) => const IntroScreen(),
        // "/home": (context) => const HomeScreen(),
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        // "/profile": (context) => const ProfileScreen(),
        "/userpreferences": (context) => const MyFormWidget(),
      },
      builder: (context, child) => StreamChat(
        client: client,
        child: child,
      ),
    );
  }
}
