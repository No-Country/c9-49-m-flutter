import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/Home/home_screen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  // Funcion que muestra la pantlla de 'preferencias de usuario'
  
  void _secondView(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
        return Scaffold(
              
          appBar:  AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
      
    ),

    body:  Container(
        padding: const EdgeInsets.only(left: 15, top:58, right: 15),
        child: GestureDetector(
            onTap: () {
                FocusScope.of(context).unfocus();
            },
            child: ListView(
                    children: [
                    Center(
                    child: Stack(
                    children: [
                    Container(
                        width: 56,
                        height: 56,
                        decoration:  BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        shape:  BoxShape.circle,
                        image: const DecorationImage( 
                        image:  AssetImage ('assets/avatarPerfil.jpeg')
                        )
                        ),       
                    ),
                 ],
               ),
            ),

        const Padding(
            padding:  EdgeInsets.only(top: 8),
              
            child: 
        Text('Nombre', textAlign: TextAlign.center, style: TextStyle(fontWeight:FontWeight.w400, fontFamily:'roboto',fontSize: 15, fontStyle: FontStyle.normal )),
            ),
        Container(
            padding: const EdgeInsets.only(top: 14),
            child: const Icon( Icons.emoji_flags, size: 18,),
            ),

        const Padding(
            padding:  EdgeInsets.all(10.0),
            child: Text('Cordoba, Argentina', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 11.0, fontWeight: FontWeight.w200),
            ),
            ),
       
        const Padding(
            padding:  EdgeInsets.all(32.0),
            child: Text('Español      Italiano      Frances', textAlign: TextAlign.center,
            style:   TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,),
            ),
            ),

        Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Hola a todos! Mi nombre es Florencia y estoy aprendiendo italiano y francés.' ,
                style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                ),
                Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Me encantaría hacer amigos de otros países, conocer distintas culturas y practicar un idioma distinto. ' ,
                style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                ),

                const Padding(
            padding:  EdgeInsets.all(32.0),
            child: Text('Intereses y aficiones', textAlign: TextAlign.center,
            style:   TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,),
            ),
            ),
            ],
           ),
          ),
        ),
       );
      },
    ),
      
  );
}







String imageURL = '';
// Funcion para elegir imagen de la galeria y subirla a firestore. Revisar.
void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery
    );
    Reference ref = FirebaseStorage.instance.ref().child('perfilPic hardcodeado prueba');
   await ref.putFile(File(image!.path));
   ref.getDownloadURL().then((value){
    print(value);
   });
}

  @override
  Widget build(BuildContext context) {
      
return  

  Container(
            padding: const EdgeInsets.only(left: 15, top:58, right: 15),
            child: GestureDetector(
            onTap: () {
                // FocusScope.of(context).unfocus();
                // pickUploadImage sube la imagen de perifl a firebase. Revisar
               pickUploadImage();
            },
            child: ListView(
                children: [
                    Center(
                    child: Stack(
                        children: [
                    Container(
                        width: 56,
                        height: 56,
                        decoration:  BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        shape:  BoxShape.circle,
                        image: const DecorationImage( 
                        image:  AssetImage ('assets/avatarPerfil.jpeg')
                        
                            )
                        ),       
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(0, 90, 194, 0.5),
                        ),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                       
                      
                       
                        
                        )
                    )
                   ],
               ),
               
            ),

        const Padding(
            padding:  EdgeInsets.only(top: 8),
              
            child: 
        Text('Nombre', textAlign: TextAlign.center, style: TextStyle(fontWeight:FontWeight.w400, fontFamily:'roboto',fontSize: 15, fontStyle: FontStyle.normal )),
            ),
        Container(
            padding: const EdgeInsets.only(top: 14),
            child: const Icon( Icons.emoji_flags, size: 18,),
            ),

        const Padding(
            padding:  EdgeInsets.all(10.0),
            child: Text('Cordoba, Argentina', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 11.0, fontWeight: FontWeight.w200),
            ),
            ),
       
        const Padding(
            padding:  EdgeInsets.all(32.0),
            child: Text('Español      Italiano      Frances', textAlign: TextAlign.center,
            style:   TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,),
            ),
            ),

        Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Hola a todos! Mi nombre es Florencia y estoy aprendiendo italiano y francés.' ,
                style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                ),
                Container(
                padding: const EdgeInsets.all(10),
                child: const Text('Me encantaría hacer amigos de otros países, conocer distintas culturas y practicar un idioma distinto. ' ,
                style: TextStyle(color: Colors.black, fontSize: 12.0),
                ),
                ),

                const Padding(
            padding:  EdgeInsets.all(32.0),
            child: Text('Intereses y aficiones', textAlign: TextAlign.center,
            style:   TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,),
            ),
            ),

           ],
         ),
       ),
     );

}

}



