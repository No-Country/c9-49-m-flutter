import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Authentication/login_screen.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart' as stream;
import "package:flutter_svg/flutter_svg.dart";

// Services:
import '../../services/auth_service.dart';

// Types:
import '../../types/user.dart';

// Modal:
import '../../widgets/Modals/confirm_logout_modal.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key, required this.user});

  final UserInDB user;

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final String name = widget.user.name;
    final String image = widget.user.image;
    const String country = 'Cordoba, Argentina';

    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 15.0),
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
                        image: DecorationImage(image: NetworkImage(image))),
                  ),
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

            const Padding(padding: EdgeInsets.only(bottom: 32)),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: const Color.fromRGBO(0, 90, 194, 1)),
                  child: const Text(
                    'Cerrar sesión',
                    style: TextStyle(
                      color: Color.fromRGBO(230, 230, 230, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    showConfirmModal(context,
                        title: "¡Atención!",
                        description:
                            "¿Estás seguro que quieres cerrar sesión en “Speak Easy”?",
                        onConfirm: () async {
                      final client = stream.StreamChat.of(context).client;
                      await _authService.logout(streamClient: client);
                      Navigator.pushNamed(context, '/login');
                    });

                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return Dialog(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(5.0),
                    //         ),
                    //         backgroundColor: Colors.white,
                    //         child: Container(
                    //           // width: MediaQuery.of(context).size.width - 5,

                    //           padding: const EdgeInsets.all(0),
                    //           child: Column(
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: [
                    //               Container(
                    //                 padding: const EdgeInsets.fromLTRB(
                    //                     15, 0, 15, 15),
                    //                 child: Column(
                    //                   children: [
                    //                     const Padding(
                    //                         padding: EdgeInsets.only(top: 15)),
                    //                     const Text(
                    //                       '¡Atención!',
                    //                       style: TextStyle(
                    //                           fontSize: 19.0,
                    //                           fontWeight: FontWeight.w700,
                    //                           fontStyle: FontStyle.normal),
                    //                     ),
                    //                     const SizedBox(height: 32.0),
                    //                     const Text(
                    //                       '¿Estás seguro que quieres cerrar sesión en "Speak Easy"?',
                    //                       style: TextStyle(fontSize: 14.0),
                    //                       textAlign: TextAlign.center,
                    //                     ),
                    //                     const SizedBox(height: 20.0),
                    //                     Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.center,
                    //                       children: [
                    //                         Container(
                    //                           alignment: Alignment.center,
                    //                           child: ElevatedButton(
                    //                             onPressed: () async {
                    //                               final client =
                    //                                   stream.StreamChat.of(
                    //                                           context)
                    //                                       .client;
                    //                               await _authService.logout(
                    //                                   streamClient: client);
                    //                               Navigator.push(context,
                    //                                   MaterialPageRoute(
                    //                                       builder: (context) {
                    //                                 return const LoginScreen();
                    //                               }));
                    //                             },
                    //                             style: TextButton.styleFrom(
                    //                                 shape: RoundedRectangleBorder(
                    //                                     borderRadius:
                    //                                         BorderRadius
                    //                                             .circular(5)),
                    //                                 backgroundColor:
                    //                                     const Color.fromRGBO(
                    //                                         0, 90, 194, 1),
                    //                                 padding:
                    //                                     const EdgeInsets.all(
                    //                                         14.0)),
                    //                             child: const Text('Aceptar',
                    //                                 style: TextStyle(
                    //                                   color: Color.fromRGBO(
                    //                                       230, 230, 230, 1),
                    //                                   fontSize: 14,
                    //                                   fontWeight:
                    //                                       FontWeight.w600,
                    //                                 )),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.center,
                    //                       children: [
                    //                         Container(
                    //                           width: 136,
                    //                           alignment: Alignment.center,
                    //                           child: ElevatedButton(
                    //                             onPressed: () async {
                    //                               {
                    //                                 Navigator.of(context).pop();
                    //                               }
                    //                               {}
                    //                             },
                    //                             style: TextButton.styleFrom(
                    //                                 shape: RoundedRectangleBorder(
                    //                                     borderRadius:
                    //                                         BorderRadius
                    //                                             .circular(5)),
                    //                                 backgroundColor:
                    //                                     const Color.fromRGBO(
                    //                                         0, 90, 194, 1),
                    //                                 padding:
                    //                                     const EdgeInsets.all(
                    //                                         14.0)),
                    //                             child: const Text('Cancelar',
                    //                                 style: TextStyle(
                    //                                   color: Color.fromRGBO(
                    //                                       230, 230, 230, 1),
                    //                                   fontSize: 14,
                    //                                   fontWeight:
                    //                                       FontWeight.w600,
                    //                                 )),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
