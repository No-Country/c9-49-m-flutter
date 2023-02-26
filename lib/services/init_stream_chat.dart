import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../utils/userdata.utils.dart';

Future<StreamChatClient> initStreamChat(
    {required firebase.User firebaseUser,
    required StreamChatClient client}) async {
  var uid = firebaseUser.uid;
  // var token = await firebaseUser.getIdToken();
  var email = firebaseUser.email;
  final user = User(id: uid, extraData: {
    "name": "Agus",
    "image": UserDataUtils.getUserImage("Tomas Salina"),
    "email": email
  });
  await client.connectUser(user, client.devToken(uid).rawValue);

  return client;
}
