import "package:cloud_firestore/cloud_firestore.dart";

// Types:
import '../types/user.dart';

class UserService {
  Future<void> updateImg({required String uid, required String image}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .update({"image": image});
  }

  Future<UserInDB> findById({
    required String uid,
  }) async {
    UserInDB user;

    try {
      final userRef = FirebaseFirestore.instance.collection('users').doc(uid);
      final result = await userRef.get();

      final userInDB = UserInDB(
          id: result.get('id'),
          name: result.get('name'),
          email: result.get('email'),
          image: result.get('image'),
          born: result.get('born'),
          gender: result.get('gender'),
          userDescription: result.get('userDescription'),
          nativeLanguage: result.get('nativeLanguage'),
          targetLanguage: result.get('targetLanguage'),
          levelTarget: result.get('levelTarget'),
          hobbies: result.get('hobbies'));

      user = userInDB;
    } on FirebaseException {
      rethrow;
    }

    return user;
  }
}
