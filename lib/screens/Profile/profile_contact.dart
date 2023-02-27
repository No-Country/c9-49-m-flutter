import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Language { 
  final String name;
  final int level;
  const Language ({required this.name, required this.level});

}

class ProfileContact extends StatefulWidget {
  const ProfileContact({super.key, required this.user});

final User user;

  @override
  State<ProfileContact> createState() => _ProfileContactState();
}

class _ProfileContactState extends State<ProfileContact> {
  final String name = 'Agus';
  final String country = 'Cordoba, Argentina';
  final List<Language> languages = const [Language(name: 'español', level: 4), Language(name: 'Italiano', level: 3), Language(name: 'Frances', level: 2)];
  
  
final String description = "Hola a todos! Mi nombre es Florencia y estoy aprendiendo italiano y francés. \n\nMe encantaría hacer amigos de otros países, conocer distintas culturas y practicar un idioma distinto.";
final hobbies = ['Deportes', 'Viajar', ' Leer', 'Peliculas', 'Salir con amigos', 'Comer'];
final flag = [];


// Funcion que muestra la pantlla de 'preferencias de usuario'
  void _secondView(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
          
        return const Text('Cerrar sesion');
      },
    ),
      
  );
}

@override
  Widget build(BuildContext context) {
      
return  

  Container(
    color: Colors.white,
            padding: const EdgeInsets.only(left: 15, top:16, right: 15),
            child: GestureDetector(
            
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
                      bottom: 1,
                      right: 2.2,
                      
                      child: Container(
                        height: 11,
                        width: 11,
                        decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.all(Radius.circular(3)),
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

        Padding(
            padding: const  EdgeInsets.only(top: 8),
              
            child: 
        Text(name, textAlign: TextAlign.center, style: const TextStyle(fontWeight:FontWeight.w400, fontFamily:'roboto',fontSize: 15, fontStyle: FontStyle.normal )),
            ),
        Container (
            padding: const EdgeInsets.only(top: 14),
            child: const Icon( Icons.emoji_flags, size: 18,),
            ),

           Padding(
            padding: const  EdgeInsets.all(10.0),
            child:  Text(  country, textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 11.0, fontWeight: FontWeight.w200),
            ),
            ),
       
        const Padding(
            padding:  EdgeInsets.all(32.0),
            child: Text('Español      Italiano      Frances', textAlign: TextAlign.center,
            style:   TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,),
            ),
            ),

        Container(
                padding: const EdgeInsets.all(16),
                child:  Text( description ,
                style:const TextStyle(color: Colors.black, fontSize: 14.0),
                ),
                ),
        
                 const Padding(
            padding:  EdgeInsets.all(16.0),
            child: Text('Intereses y aficiones', textAlign: TextAlign.start,
            style:   TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold, ),
            ),
            ),
          
       
         
                Builder(
                  builder: (context) {
                    return Row(
                      children: [
                        Container ( 
                          width: 78,
                          height: 21,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(227, 227, 227, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text('Deportes', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
                        ),   
                        Container ( 
                          width: 78,
                          height: 21,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(227, 227, 227, 1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text('Deportes', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
                        ), 
                        
                        
                      ],
                    );
                  }
                )
          
            

           ],
         ),
       ),
     );

}

}