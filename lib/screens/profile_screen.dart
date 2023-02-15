
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class ProfileScreen extends StatefulWidget {
 

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

// Funcion que muestra una segunda vista del perfil
void _secondView(){
  Navigator.of(context).push(
    new MaterialPageRoute<void>(
      builder: (BuildContext context){
       return Scaffold(
            
        backgroundColor: Color.fromRGBO(235, 241, 159, 1),
        appBar: AppBar ( 
       
        elevation: 0, 
        backgroundColor: Color.fromRGBO(235, 241, 159, 1),
        title: Text('Perfil de Usuario', style: TextStyle(color: Colors.black)),
            
          ),
        body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
        children: <Widget>[ 
        // _image != null ? Image.file(_image!,  
        //     width: 250, 
        //     height: 250,
        //     fit: BoxFit.cover,
        //      ) :
              Container(
            height: 100,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/avatarPerfil.jpeg')
                       ),
                      
        shape: BoxShape.circle,
                  border: Border.all(
        color: Colors.blue,
        width: 3,
                      ),
                    ),
        ),
            
        // ElevatedButton( // seleccionar imagen de perfil / Cambiar el estilo del boton
        // onPressed: getImage, child: const Text('seleccionar imagen')),
                    

        // ignore: prefer_const_constructors
        Padding(
            
        padding: const EdgeInsets.all(8.0),
        child: Text('Borerj fjwbbh', style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold )),
        ),
                  

        // ignore: prefer_const_constructors
        Padding(
                padding: const EdgeInsets.all(1.0),
                child: Icon( Icons.emoji_flags),
        ),
            
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('Horem ipsum dolor sit amet consectetur',
        style: TextStyle(color: Colors.black, fontSize: 14.0) ,
        ),
        ),
        Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text('Español      Italiano      Frances',
        style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        ),
              
       
    ],
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
      this._image = imageTemporary;
    });
}

  @override
  Widget build(BuildContext context) {
      
          return Scaffold(
            
        backgroundColor: Color.fromRGBO(235, 241, 159, 1),
        appBar: AppBar ( 
          actions: <Widget>[
            new IconButton(icon: const Icon(Icons.settings), onPressed: _secondView),
          ],
        // leading: BackButton ( 
        //         onPressed: ()=> {
        //             Navigator.push(
        //                 context, MaterialPageRoute(builder: (context)=> Profile2Screen()))
        //         }
        //     ),
        elevation: 0, // sombra, borde.
        backgroundColor: Color.fromRGBO(235, 241, 159, 1),
        title: Text('Perfil de Usuario', style: TextStyle(color: Colors.black)),
            
          ),
        body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
        children: <Widget>[ 
        _image != null ? Image.file(_image!,  
            width: 250, 
            height: 250,
            fit: BoxFit.cover,
             ) : Container(
            height: 100,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/avatarPerfil.jpeg')
                       ),
                      
        shape: BoxShape.circle,
                  border: Border.all(
        color: Colors.blue,
        width: 3,
                      ),
                    ),
        ),
            
        ElevatedButton( // seleccionar imagen de perfil / Cambiar el estilo del boton
        onPressed: getImage, 
        child: const Text('seleccionar imagen')),// subir imagen a firebase
                    

        
        Padding(
            
        padding: const EdgeInsets.all(8.0),
        child: Text('Borerj fjwbbh', style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold )),
        ),
                  

                Padding(
                padding: const EdgeInsets.all(1.0),
                child: Icon( Icons.emoji_flags),
        ),
            
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('Horem ipsum dolor sit amet consectetur',
        style: TextStyle(color: Colors.black, fontSize: 14.0) ,
        ),
        ),
        Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text('Español      Italiano      Frances',
        style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        ),
              
        Container(
        padding: EdgeInsets.all(10),
        child: Text('Borem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
        style: TextStyle(color: Colors.black, fontSize: 16.0),
                           
        ),
                          
    ),
    ],
    ),
              
              
    )
     
    );
  }
}