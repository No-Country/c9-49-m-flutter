import 'package:flutter/material.dart';

// Screens:
import '../Home/home_screen.dart';

// Types:
import '../../types/user.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key, required this.userInDB}) : super(key: key);

  final UserInDB userInDB;

  @override
  Widget build(BuildContext context) {
    void goToHome() {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen(user: userInDB);
      }));
    }

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: goToHome,
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 217,
              height: 110,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logos/logo.png'))),
            ),
            const SizedBox(
              height: 22.0,
            ),
            const Text(
              '¡Empezá a conectar!',
              style: TextStyle(
                  color: Color.fromRGBO(70, 70, 70, 1), fontSize: 24.0),
            )
          ],
        ),
      ),
    );
  }
}
