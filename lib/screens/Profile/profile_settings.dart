

import 'package:flutter/material.dart';
// import '../../widgets/Buttons/primary_button.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
    final String name = 'Agus';
  final String country = 'Cordoba, Argentina';
  @override
  Widget build(BuildContext context) {
 
return  Container(
    color: Colors.white,
            padding: const EdgeInsets.only(left: 15, top:16, right: 15),
             child: GestureDetector(
            // onTap: () {
            //     // FocusScope.of(context).unfocus();
            //     // pickUploadImage sube la imagen de perifl a firebase. Revisar
            //   //  pickUploadImage();
               
            // },
            
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
        
            Row(
              
              children: const [
                 SizedBox(
                  width: 30,
                  height: 20,
                  child:  Icon(Icons.notifications_none),
                 ),  Text('Notificaciones'),
                 ],
            ),
            Row(
              children: const [
                 SizedBox(
                  width: 30,
                  height: 20,
                  child:  Icon(Icons.lock_outline),
                 ), 
                  Text('Privacidad'),
                  ],
            ),
            
              Row(
              children: const [
                 SizedBox(
                  width: 30,
                  height: 20,
                  child:  Icon(Icons.help_outline),
                 ),  Text('Información'),
                 
              ],
            ),


        


            Container(
              alignment: Alignment.center,
              child: ElevatedButton( 
              onPressed: () {},
              style: 
              TextButton.styleFrom(
              shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30)
              ),
               backgroundColor: const Color.fromRGBO(0, 90, 194, 1),
               padding: const EdgeInsets.all(14.0)),
               child: const Text('Cerrar sesión',
               style:  TextStyle(
               color: Color.fromRGBO(230, 230, 230, 1),
              fontSize: 14,
             fontWeight: FontWeight.w500,
          )),
    ),    
                    
              ),
            
                ],
            ),
            
             ),
             
  );
  


  

  }
}