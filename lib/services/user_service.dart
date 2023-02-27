import "package:cloud_firestore/cloud_firestore.dart";

class UserService {
  Future<DocumentSnapshot<Map<String, dynamic>>> getInfo(
      {required String userId}) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    final user = await userRef.get();
    return user;
  }
}
