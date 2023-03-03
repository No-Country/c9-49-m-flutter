import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/utils/formating_strings.dart';
import "package:flutter_svg/flutter_svg.dart";

// Types:
import '../../types/user.dart';

// Data:
import '../../data/languages.dart';

// Theme:
import '../../theme/colors_theme.dart';

//Service:
import "../../services/user_service.dart";

class Language {
  final String name;
  final int level;
  const Language({required this.name, required this.level});
}

class ConnectProfile extends StatefulWidget {
  const ConnectProfile({super.key, required this.user});

  final UserInDB user;

  @override
  State<ConnectProfile> createState() => _ConnectProfileState();
}

class _ConnectProfileState extends State<ConnectProfile> {
  @override
  Widget build(BuildContext context) {
    print(widget.user.id.toString());

    // final String uid = widget.user.id;
    final String name = widget.user.name;
    const String country = 'Cordoba, Argentina';
    final String image = widget.user.image;

    final String nativeLang = widget.user.nativeLanguage;
    final nativeLangText = languages
        .firstWhere((lang) => lang["code"] == nativeLang)['name']
        .toString();

    final String targetLang = widget.user.targetLanguage;
    final targetLangText = languages
        .firstWhere((lang) => lang["code"] == targetLang)['name']
        .toString();

    final String levelTarget = "principiante";
    final double levelTargetWidth = levelTarget == "principiante"
        ? 2.0
        : levelTarget == "elemental"
            ? 5.0
            : levelTarget == "intermedio"
                ? 10.0
                : 15.0;

    final String description = widget.user.userDescription;

    final List<dynamic> hobbies = widget.user.hobbies;
    Iterable<Container> hobbiesBoxes = hobbies.map((hobby) {
      return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color.fromRGBO(227, 227, 227, 1)),
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
          child: Text(capitalize(hobby),
              style: const TextStyle(
                  fontSize: 12.0, color: Color.fromRGBO(32, 32, 32, 1))));
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: ListView(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(image))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'roboto',
                      fontSize: 15,
                      fontStyle: FontStyle.normal)),
            ),
            Container(
              padding: const EdgeInsets.only(top: 14),
              child: SvgPicture.asset(
                'assets/flags/argentina.svg',
                height: 14,
                width: 18,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 20.0),
              child: Text(
                country,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(nativeLangText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                width: 15.0,
              ),
              Container(
                color: LightModeColors.secondaryColor,
                width: 15.0,
                height: 3.0,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text(targetLangText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                width: 15.0,
              ),
              Row(
                children: [
                  Container(
                    color: LightModeColors.secondaryColor,
                    width: levelTargetWidth,
                    height: 3.0,
                  ),
                  Container(
                    color: const Color.fromRGBO(194, 194, 194, 1),
                    width: 15.0 - levelTargetWidth,
                    height: 3.0,
                  ),
                ],
              )
            ]),
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                description,
                style: const TextStyle(color: Colors.black, fontSize: 14.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 28.0, bottom: 16.0),
              child: Text(
                'Intereses y aficiones',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Wrap(
                spacing: 7.0,
                runSpacing: 7.0,
                children: hobbiesBoxes.map((hobby) => hobby).toList())
          ],
        ),
      ),
    );
  }
}
