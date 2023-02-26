
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter_application_1/screens/Profile/profile_settings.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import './connect_screen.dart';
import '../Chat/chat_screen.dart';
import '../Profile/profile_screen.dart';

class Page {
  final Widget screen;
  final String title;
  final Icon action;

  const Page({required this.screen, required this.title, required this.action});
}

class HomeScreen extends StatefulWidget {
  final firebase.User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   final result =
  //       widget.client.queryUsers(filter: Filter.equal('role', 'user'));
  //   print(result);
  //   super.initState();
  // }

  int currentPage = 1;
  

  @override
  
  Widget build(BuildContext context) {
    final List<Page> pages =  [
   const Page(
      screen: ChatScreen(),
      title: "Conversaciones",
      action: Icon(
        Icons.add,
        color: Color.fromRGBO(0, 90, 194, 1),
        size: 25.0,
      ),
    ),
   const Page(
      screen: ConnectScreen(),
      title: "Buscar compañeros",
      action: Icon(
        Icons.add,
        color: Color.fromRGBO(0, 90, 194, 1),
        size: 25.0,
      ),
    ),
    const Page(
// ProfileSetting para poder maquetar provisoriamente, luego volver a :
// screen: ProfileScreen(user: widget.user)
      screen: ProfileSettings(),
      title: "",
      action: 
        Icon(
        Icons.settings, 
        color: Color.fromRGBO(0, 90, 194, 1),
        size: 25.0, 
      ), 
    ),
  ];
    final page = pages[currentPage];
    final pageTitle = page.title;
    final actionIcon = page.action;
    

    return Scaffold(
      appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25.0,
          ),
          title: Text(
            pageTitle,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 90, 194, 1)),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
          
              child: actionIcon
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0),
      body: page.screen,
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
