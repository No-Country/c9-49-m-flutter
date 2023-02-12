import "package:flutter/material.dart";

class Lading extends StatelessWidget {
  const Lading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(213, 221, 234, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Speak Easy",
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 35),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Image.asset("assets/landing/1.png"),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 150,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/onboarding');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 251, 239),
                        minimumSize: Size(200, 50)),
                    child: const Text(
                      "REGISTRARME",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.amber,
                        minimumSize: Size(200, 50)),
                    child: const Text("INICIAR SESIÓN",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
