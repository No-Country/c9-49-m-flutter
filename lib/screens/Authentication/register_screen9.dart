import 'package:flutter/material.dart';
import "../../widgets/Texts/title.dart";
import '../../widgets/Buttons/primary_button.dart';
import "../../widgets/Texts/title.dart";

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class RegisterScreen9 extends StatefulWidget {
  const RegisterScreen9({super.key});

  @override
  State<RegisterScreen9> createState() => _RegisterScreen9State();
}



class _RegisterScreen9State extends State<RegisterScreen9> {
  
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
   return  Scaffold(
         appBar:  AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
            
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: (){},
            child:  const Text('OMITIR', style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1), fontSize: 14, fontWeight:FontWeight.w500) ,),
          ),
          const SizedBox(height: 40,),
          ],
          // arreglar margenes del texto
         title: const Text('Elegí tu foto de perfil',   style: TextStyle(color: Colors.black), textAlign: TextAlign.left,),

      ),
        body:  Container(
          
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
                        ),
                        
                    ),
               
                    
                   ],
                   
               ),
               
            ),
            ],
            
            
          
         ),
         
       ),
       
     ),
     
  

   );

  }
}



