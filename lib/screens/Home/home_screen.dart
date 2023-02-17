import 'package:flutter/material.dart';

import './connect_screen.dart';
import '../Chat/chat_screen.dart';
import '../Profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  var pages = [
    [ChatScreen()],
    [ConnectScreen()],
    [ProfileScreen()],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 49, 128, 189),
        title: Text("Speak easy $currentPage"),
         elevation: 5,
      ),
      body: PageView(
        children: pages[currentPage]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 49, 128, 189),
        selectedItemColor: Colors.white.withOpacity(1),
        unselectedItemColor: Colors.grey,
        items: const [
            BottomNavigationBarItem(
            icon: Icon( Icons.forum_outlined),
            label: 'Mensajes'
            ),
             BottomNavigationBarItem(
            icon: Icon( Icons.spatial_audio_off_outlined),
            label: 'Conectar'
            ),
             BottomNavigationBarItem(
            icon: Icon( Icons.account_circle_outlined ),
            label: 'Perfil'
             ),
          ],
        ),

    );
  }
}
