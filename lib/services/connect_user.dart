import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import "package:cloud_firestore/cloud_firestore.dart";

import '../utils/userdata.utils.dart';

class UserInDB {
  final String name;
  final String targetLanguage;
  final String image;
  final String nativeLanguage;

  UserInDB(
      {required this.name,
      required this.targetLanguage,
      required this.image,
      required this.nativeLanguage});
}

Future<StreamChatClient> connectUserToChat(
    {required firebase.User firebaseUser,
    required StreamChatClient client}) async {
  final userRef =
      FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid);

  final userInDb = await userRef.get();
  final name = userInDb.get('name');
  final image = userInDb.get('image');
  final nativeLanguage = userInDb.get('nativeLanguage');
  final targetLanguage = userInDb.get('targetLanguage');

  var uid = firebaseUser.uid;
  // var token = await firebaseUser.getIdToken();
  // var email = firebaseUser.email;}
  print("$name,$image,$nativeLanguage,$targetLanguage");

  final user = User(id: uid, extraData: {
    "name": name,
    "targetLanguage": targetLanguage,
    "image": image,
    "nativeLanguage": nativeLanguage,
    "email": firebaseUser.email
  });
  await client.connectUser(user, client.devToken(uid).rawValue);

  return client;
}
