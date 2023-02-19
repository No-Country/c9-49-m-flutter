import 'dart:io';
// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  // Funcion que muestra una segunda vista del perfil
  
  void _secondView(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
        return Scaffold(
              
          appBar:  AppBar(
            title: const Text('Perfil'),
            leading: IconButton(
             icon: const Icon(
                Icons.arrow_back,
                color:  Colors.white,
             ),
             onPressed: () {},
        ),

        actions: [
            IconButton(
                icon: const Icon(
                Icons.settings,
                color: Colors.white,
                ),
                onPressed:  (_secondView), 
                )
        ],
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
/////////////////// Codigo para cambiar la imagen de perfil, en la screen de otro usuario no va este codigo.
///
                    // Positioned(
                    //   bottom: 0,
                    //   right: 0,
                      
                    //   child: Container(
                    //     height: 20,
                    //     width: 20,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.rectangle,
                    //       borderRadius: const BorderRadius.all(Radius.circular(4)),
                    //       border: Border.all(
                    //         width: 1,
                    //         color: const Color.fromRGBO(0, 90, 194, 0.5),
                    //       ),
                    //       color: const Color.fromRGBO(255, 255, 255, 1),
                    //     ),
                       
                    //    child: IconButton(
                    //    onPressed: getImage, icon: const Icon(
                    //         Icons.edit), 
                    //          color: const Color.fromRGBO(0, 148, 175, 1),
                    //          ),
                    //    )
                    // )
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

        ]
      ),
    ),
  )


      
      );
        
        }
        ),
      
    );
  }

// Picker manager para seleccionar fotos de la galeria
File? _image;

Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null ) return;

    final imageTemporary = File(image.path);

    setState(() {
      _image = imageTemporary;
    });
}

  @override
  Widget build(BuildContext context) {
      
return  Scaffold(
         appBar:  AppBar(
            title: const Text('Mi perfil'),
            leading: IconButton(
             icon: const Icon(
                Icons.arrow_back,
                color:  Colors.white,
             ),
             onPressed: () {},
        ),
        actions: [
            IconButton(
                icon: const Icon(
                Icons.settings,
                color: Colors.white,
                ),
                onPressed:  (_secondView), 
                )
        ],
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
                       
                       child: IconButton(
                    
                        onPressed: getImage, icon: const Icon(
                            Icons.edit), 
                             color: const Color.fromRGBO(0, 148, 175, 1),
                             
                             
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

        ]
      ),
    ),
  )

);



  }

}






