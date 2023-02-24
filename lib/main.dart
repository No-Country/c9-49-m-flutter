import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:stream_chat_flutter/stream_chat_flutter.dart";

// SCREENS:
import "./screens/Onboarding/intro_screen.dart";
import "./screens/Onboarding/onboarding_screen.dart";
import './screens/Profile/profile_screen.dart';
import "./screens/Authentication/login_screen.dart";
import "./screens/Authentication/register_screen.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCgbvaQflUG-Vw7iK_11MI0HfoNSo7a6s4",
    projectId: "speak-easy-no-country-c78ba",
    messagingSenderId: "1062828650314",
    appId: "1:1062828650314:web:c6dee7dbf7b98412bb9bb3",
  ));

  final client = StreamChatClient(
    '6gdnp9syk79d',
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
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false, // eliminar banda 'debug' borde sup
      title: 'SpeakEasy',
      routes: {
        "/": (context) => const IntroScreen(),
        // "/home": (context) => const HomeScreen(),
        "/onboarding": (context) => const OnboardingScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/profile": (context) => const ProfileScreen(),
      },
      builder: (context, child) => StreamChat(
        client: client,
        child: child,
      ),
    );
  }
}
