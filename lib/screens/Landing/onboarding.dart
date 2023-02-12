import "package:flutter/material.dart";

class AppBar extends StatelessWidget {
  final int currentPage;
  const AppBar({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 40,
          ),
          label: Text(""),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(0, 0, 0, 0)),
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              "OMITIR",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ))
      ],
    );
  }
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class Description {
  String img;
  String text;
  Color color;
  Description(this.img, this.text, this.color);
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;

  List<Description> descriptions = [
    Description(
        "assets/landing/2.png",
        "Aprendé un nuevo idioma. Lorem ipsum dolor sit amet consectetur",
        Color.fromRGBO(180, 240, 170, 1)),
    Description(
        "assets/landing/3.png",
        "Corem ipsum dolor sit amet, consectetur adipiscing elit.",
        Color.fromRGBO(235, 241, 159, 1)),
    Description(
        "assets/landing/4.png",
        "Corem ipsum dolor sit amet, consectetur adipiscing elit.",
        Color.fromRGBO(241, 212, 212, 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
      color: descriptions[currentPage].color,
      child: Column(
        children: [
          AppBar(currentPage: currentPage),
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
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    decoration: TextDecoration.none),
              )
            ],
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  backgroundColor: Colors.transparent,
                  side: BorderSide(
                    width: 2,
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
                style: TextStyle(color: Colors.black, fontSize: 20),
              ))
        ],
      ),
    );
  }
}
