class UserFormData {
  String name;
  String born;
  String gender;
  String nativeLanguage;
  String targetLanguage;
  String levelTarget;
  String userDescription;
  List<String>? hobbies;

  UserFormData(
      {this.name = '',
      this.born = '',
      this.gender = '',
      this.nativeLanguage = '',
      this.targetLanguage = '',
      this.levelTarget = 'principiante',
      this.userDescription = '',
      List<String>? hobbies})
      : hobbies = hobbies ?? [];
}
