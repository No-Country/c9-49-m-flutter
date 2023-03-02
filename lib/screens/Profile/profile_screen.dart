import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  void _secondView() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return const Text('Cerrar sesion');
        },
      ),
    );
  }

  String imageURL = '';
// Funcion para elegir imagen de la galeria y subirla a firestore. Revisar.
  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    Reference ref =
        FirebaseStorage.instance.ref().child('');
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
    // const List<Language> languages = const [
    //   Language(name: 'español', level: 4),
    //   Language(name: 'Italiano', level: 3),
    //   Language(name: 'Frances', level: 2)
    // ];

    final String description = widget.user.userDescription;
    final List<dynamic> hobbies = widget.user.hobbies;

    return Container(
      
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
                          border: Border.all(width: 1, color: Colors.grey),
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
        const  Padding(
            padding:  EdgeInsets.all(10.0),
            child: Text(
              country,
              textAlign: TextAlign.center,
              style:  TextStyle(
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
              style: const TextStyle(color: Colors.black, fontSize: 14.0),
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

            // HACER EL MAP PARA TRAER LOS HOBBIES

         

           
              
            //  Iterable<dynamic>  hobbies.map((e) => e);
  // Map<String, dynamic> ;
  //      hobbies.map((e) => e)

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
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                    'Leer',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                    'Viajes',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                    'Salir con amigos',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
