import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

// Screen:
import './profile_settings.dart';

// Types:
import '../../types/user.dart';

class Language {
  final String name;
  final int level;
  const Language({required this.name, required this.level});
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user});

  final UserInDB user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool settingsIsOpened = false;

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

  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    Reference ref =
        FirebaseStorage.instance.ref().child('perfilPic hardcodeado prueba');
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) async {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String name = widget.user.name;
    final String image = widget.user.image;
    const String country = 'Cordoba, Argentina';

    final String description = widget.user.userDescription;
    // final List<dynamic> hobbies = widget.user.hobbies;

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
          ? const ProfileSettings()
          : Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 15, top: 16, right: 15),
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              // FocusScope.of(context).unfocus();
                              // pickUploadImage sube la imagen de perifl a firebase. Revisar
                              pickUploadImage();
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      // image:  AssetImage('assets/avatarPerfil.jpeg'))),
                                      image: NetworkImage(image))),
                            )),
                        Positioned(
                            bottom: 1,
                            right: 2.2,
                            child: Container(
                              height: 11,
                              width: 11,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(3)),
                                border: Border.all(
                                  width: 1,
                                  color: const Color.fromRGBO(0, 90, 194, 0.5),
                                ),
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'roboto',
                            fontSize: 15,
                            fontStyle: FontStyle.normal)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 14),
                    child: const Icon(
                      Icons.emoji_flags,
                      size: 18,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      country,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      'Español      Italiano      Frances',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      description,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
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
                  Builder(builder: (context) {
                    return Row(
                      children: [
                        Container(
                          width: 78,
                          height: 21,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(227, 227, 227, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text(
                            'Deportes',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 78,
                          height: 21,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(227, 227, 227, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text(
                            'Deportes',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
    );
  }
}
