import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Profile/profile_settings.dart';

// Screens:
import '../Connect/connect_screen.dart';
import '../Chat/chat_screen.dart';

// Types:
import '../../types/user.dart';

class HomeScreen extends StatefulWidget {
  final UserInDB user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const ChatScreen(),
      ConnectScreen(
        user: widget.user,
      ),
      ProfileScreen(user: widget.user),
    ];
    final page = pages[currentPage];

    return Scaffold(
      body: page,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        color: const Color.fromRGBO(176, 178, 182, 1),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
          backgroundColor: const Color.fromRGBO(176, 178, 182, 1),
          selectedItemColor: const Color.fromRGBO(0, 90, 194, 1),
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.forum_outlined), label: 'Mensajes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.spatial_audio_off_outlined),
                label: 'Conectar'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}
