import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/login_screen.dart';
// import '../../widgets/Buttons/primary_button.dart';
// import '../../data/languages.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;
import "./../../../utils/formating_strings.dart";


// Services:
import '../../services/auth_service.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final AuthService _authService = AuthService();
  final String name = 'Agus';
  final String country = 'Cordoba, Argentina';
  // final flag =
// final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 0),
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
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage('assets/avatarPerfil.jpeg'))),
                  ),
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

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                country,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w200),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 40)),

            const ListTile(
              title: Text(
                'Notificaciones',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.notifications_none,
                color: Color.fromRGBO(0, 90, 194, 1),
                size: 20,
              ),
            ),
            // onTap: () {

            // },
            const ListTile(
              title: Text(
                'Privacidad',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.lock_outline,
                color: Color.fromRGBO(0, 90, 194, 1),
                size: 20,
              ),
            ),
            // onTap: () {

            // },
            const ListTile(
              title: Text(
                'Información',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.help_outline,
                color: Color.fromRGBO(0, 90, 194, 1),
                size: 20,
              ),
            ),
            // onTap: () {

            // },
       
           
            const Padding(padding: EdgeInsets.only(bottom: 32)),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30)),
                    backgroundColor: const Color.fromRGBO(0, 90, 194, 1)
                ),
                child: const Text('Cerrar sesión',style: TextStyle(
                      color: Color.fromRGBO(230, 230, 230, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),),
                onPressed: () {
                  
                  showDialog(context: context, 
                  builder: (BuildContext context){
                    return Dialog(
                      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: Colors.white,
        child: Container(
          // width: MediaQuery.of(context).size.width - 5,
          
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             
              Container(
                
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top:15)),
                   const Text(
                      '¡Atención!',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w700, fontStyle: FontStyle.normal
                      ),
                    ),
                  const   SizedBox(height: 32.0),
                 const   Text(
                      '¿Estás seguro que quieres cerrar sesión en "Speak Easy"?',
                      style:  TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
              Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                      
              Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  final client = stream.StreamChat.of(context).client;
                  await _authService.logout(streamClient: client);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                
                style: TextButton.styleFrom(
                
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                    backgroundColor: const Color.fromRGBO(0, 90, 194, 1),
                    
                    padding: const EdgeInsets.all(14.0)),
                child: const Text('Aceptar',
                    style: TextStyle(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                    )),
              ),
            ),
                       ],
                     ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                  width:136 ,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                     
                      { Navigator.of(context).pop();} {}
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: const Color.fromRGBO(0, 90, 194, 1),
                        padding: const EdgeInsets.all(14.0)),
                    child: const Text('Cancelar',
                        style: TextStyle(
                          color: Color.fromRGBO(230, 230, 230, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
            ),
               ],
             ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
                   
                   
                    
                  }
                  );
                },),
            ],
          )

           
          ],
        ),
      ),
    );
  }
}














