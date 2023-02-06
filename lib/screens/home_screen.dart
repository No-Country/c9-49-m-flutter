import 'package:flutter/material.dart';


class homeScreen extends StatefulWidget {
 

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

int currentPage = 0;
 var pages = [
      
      [CustomScreen(color: Colors.blueGrey,  textPlace: 'Chat')],
      [CustomScreen(color: Colors.pink,  textPlace: 'Connect')],
       [CustomScreen(color: Color.fromARGB(255, 224, 227, 238), textPlace: 'Profile')],
       
      ];

  @override
  Widget build(BuildContext context) {
    return 

     Scaffold(
    //* AppBar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 128, 189),
        title: Text("ChatLingo $currentPage"),
         elevation: 5,
      ),
      
//? Cambiar la pantalla
  


      body: PageView(
        children: pages[currentPage],

      
     

      ),
     //* Bottom navigation bar
     bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap:(index) {
      

       setState(() {
          currentPage = index;
       });
        },
        backgroundColor: Color.fromARGB(255, 49, 128, 189),
        selectedItemColor: Colors.white.withOpacity(1),
        unselectedItemColor: Colors.grey,
        items: [
            BottomNavigationBarItem(
            icon: Icon( Icons.verified_user_outlined),
            label: 'Home'
            ),
             BottomNavigationBarItem(
            icon: Icon( Icons.verified_user_sharp),
            label: 'UserSettings'
            ),
             BottomNavigationBarItem(
            icon: Icon( Icons.app_blocking),
            label: 'UserSettings'
             ),
          ],
        ),

    );
   
  }
}

class CustomScreen extends StatelessWidget {
  final Color color;
  final String textPlace; 

  const CustomScreen({  required this.color, required this.textPlace});

  @override
  Widget build(BuildContext context) {
      return Container(
        color: color,
        child: Center(
          child: Text(this.textPlace, style: TextStyle(fontSize: 25),),
          ),
      );
  }
}