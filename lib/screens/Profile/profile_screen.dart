import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:uuid/uuid.dart';
import 'dart:io';

// Screen:
import './profile_settings.dart';

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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});

  final UserInDB user;
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseStorage storage = FirebaseStorage.instance;
  UserService userService = UserService();
  bool settingsIsOpened = false;
  String _imageUrl = '';

  void _openSettings() {
    setState(() {
      settingsIsOpened = true;
    });
  }

  void _closeSettings() {
    setState(() {
      settingsIsOpened = false;
    });
  }

  Future<String> uploadImage(File file) async {
    try {
      UploadTask uploadTask;
      // Genera un ID único para la imagen
      String fileName = const Uuid().v1();

      // Crea una referencia a la ubicación donde quieres guardar la imagen en Firebase Storage
      Reference ref = storage.ref().child('images/$fileName');

      if (kIsWeb) {
        print('IS WEB');
        TaskSnapshot taskSnapshot = await ref.putData(await file.readAsBytes());
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        TaskSnapshot taskSnapshot = await ref.putFile(file);
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        return downloadUrl;
      }
    } catch (e) {
      print(e.toString());
      return '';
    }
  }

  Future<void> _pickImage(String uid) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String downloadUrl = await uploadImage(File(pickedFile.path));
      await userService.updateImg(image: downloadUrl, uid: uid);
      setState(() {
        _imageUrl = downloadUrl;
        print(_imageUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String uid = widget.user.id;
    final String name = widget.user.name;
    final String image = _imageUrl != "" ? _imageUrl : widget.user.image;
    const String country = 'Cordoba, Argentina';

    final String nativeLang = widget.user.nativeLanguage;
    final nativeLangText = languages
        .firstWhere((lang) => lang["code"] == nativeLang)['name']
        .toString();

    final String targetLang = widget.user.targetLanguage;
    final targetLangText = languages
        .firstWhere((lang) => lang["code"] == targetLang)['name']
        .toString();

    final String levelTarget = widget.user.levelTarget;
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
          padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
          child: Text(hobby,
              style: const TextStyle(
                  fontSize: 12.0, color: Color.fromRGBO(32, 32, 32, 1))));
    });

    return Scaffold(
      appBar: AppBar(
          leading: settingsIsOpened
              ? IconButton(
                  onPressed: _closeSettings,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ))
              : const SizedBox(),
          title: const Text(
            "Perfil",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 90, 194, 1)),
          ),
          actions: settingsIsOpened
              ? null
              : [
                  Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: IconButton(
                          onPressed: _openSettings,
                          icon: const Icon(
                            Icons.settings_outlined,
                            color: Color.fromRGBO(0, 90, 194, 1),
                            size: 25.0,
                          )))
                ],
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0),
      body: settingsIsOpened
          ? ProfileSettings(user: widget.user)
          : Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        GestureDetector(
                            onTap: () async {
                              await _pickImage(uid);
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(image))),
                            )),
                        Positioned(
                            bottom: 1,
                            right: 2.2,
                            child: SvgPicture.asset(
                              'assets/editAvatar.svg',
                              height: 15,
                              width: 15,
                            ))
                      ],
                    ),
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
                      style:
                          const TextStyle(color: Colors.black, fontSize: 14.0),
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
