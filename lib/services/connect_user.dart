import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// Types:
import '../types/user.dart';

Future<User> connectUserToChat(
    {required UserInDB userInDB, required StreamChatClient client}) async {
  final user = User(id: userInDB.id, extraData: {
    "name": userInDB.name,
    "email": userInDB.email,
    "image": userInDB.image,
    "nativeLanguage": userInDB.nativeLanguage,
    "targetLanguage": userInDB.targetLanguage,
  });
  await client.connectUser(user, client.devToken(userInDB.id).rawValue);

  return user;
}
