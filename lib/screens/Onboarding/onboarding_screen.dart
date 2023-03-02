import "package:flutter/material.dart";

class AppBar extends StatelessWidget {
  final int currentPage;
  final Color colorButtons;
  final Function setCurrentPage;
  const AppBar(
      {super.key,
      required this.currentPage,
      required this.colorButtons,
      required this.setCurrentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorButtons,
              side: BorderSide.none,
              elevation: 0),
          onPressed: () {
            setCurrentPage(currentPage - 1);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 40,
          ),
          label: const Text(""),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: colorButtons,
                side: BorderSide.none,
                elevation: 0),
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text(
              "OMITIR",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ))
      ],
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class Description {
  String img;
  String text;
  Color color;
  Description(this.img, this.text, this.color);
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  // ignore: non_constant_identifier_names
  List<Color> colorsPages = [
    const Color.fromRGBO(180, 240, 170, 1),
    const Color.fromRGBO(235, 241, 159, 1),
    const Color.fromRGBO(241, 212, 212, 1),
  ];

  List<Description> descriptions = [
    Description("assets/landing/2.png", "Aprendé un nuevo idioma",
        const Color.fromRGBO(180, 240, 170, 1)),
    Description("assets/landing/3.png", "Practicá con nativos de todo el mundo",
        const Color.fromRGBO(235, 241, 159, 1)),
    Description("assets/landing/4.png", "Y conocé nuevas personas",
        const Color.fromRGBO(241, 212, 212, 1)),
  ];

  void setCurrentPage(page) {
    if (currentPage == 0) {
      Navigator.pushNamed(context, '/');
    } else {
      setState(() {
        currentPage = page;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
      color: descriptions[currentPage].color,
      child: Column(
        children: [
          AppBar(
              currentPage: currentPage,
              colorButtons: colorsPages[currentPage],
              setCurrentPage: setCurrentPage),
          Column(
            children: [
              Row(children: [
                Expanded(
                  flex: 10,
                  child: Image.asset(descriptions[currentPage].img),
                ),
              ]),
              Text(
                descriptions[currentPage].text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  backgroundColor: colorsPages[currentPage],
                  side: const BorderSide(
                    width: 1,
                  )),
              onPressed: () {
                if (currentPage + 1 == descriptions.length) {
                  Navigator.pushNamed(context, '/register');
                } else {
                  setState(() {
                    currentPage = currentPage + 1;
                  });
                }
              },
              child: Text(
                currentPage == 2 ? "REGISTRARME" : "CONTINUAR",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ))
        ],
      ),
    );
  }
}
