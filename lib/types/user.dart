class UserInDB {
  final String id;
  final String name;
  final String email;
  final String image;
  final String born;
  final String gender;
  final String userDescription;
  final String nativeLanguage;
  final String targetLanguage;
  final String levelTarget;
  final List<dynamic> hobbies;

  UserInDB({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.born,
    required this.gender,
    required this.userDescription,
    required this.nativeLanguage,
    required this.targetLanguage,
    required this.levelTarget,
    required this.hobbies,
  });
}

class UserInStreamChat {
  final String name;
  final String email;
  final String image;
  final String nativeLanguage;
  final String targetLanguage;

  UserInStreamChat(
      {required this.name,
      required this.email,
      required this.image,
      required this.nativeLanguage,
      required this.targetLanguage});
}
