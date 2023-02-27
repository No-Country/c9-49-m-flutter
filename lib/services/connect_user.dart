import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// Types:
import '../../types/user_info.dart';

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
    {required UserCustomInfo userInfo,
    required StreamChatClient client}) async {
  // final userRef =
  //     FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid);

  // final userInDb = await userRef.get();
  // final name = userInDb.get('name');
  // final image = userInDb.get('image');
  // final nativeLanguage = userInDb.get('nativeLanguage');
  // final targetLanguage = userInDb.get('targetLanguage');

  // var uid = firebaseUser.uid;
  // // var token = await firebaseUser.getIdToken();
  // // var email = firebaseUser.email;}
  // print("$name,$image,$nativeLanguage,$targetLanguage");

  final data = User(id: userInfo.id, extraData: {
    "name": userInfo.name,
    "email": userInfo.email,
    "image": userInfo.image,
    "nativeLanguage": userInfo.nativeLanguage,
    "targetLanguage": userInfo.targetLanguage,
  });
  await client.connectUser(data, client.devToken(userInfo.id).rawValue);

  return client;
}
