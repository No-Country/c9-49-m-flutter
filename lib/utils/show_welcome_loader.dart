import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 22.0,
          ),
          const CircularProgressIndicator(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

Future<void> showWelcomeLoader(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog.fullscreen(
        backgroundColor: Colors.white,
        child: WelcomeScreen(),
      );
    },
  );
}
