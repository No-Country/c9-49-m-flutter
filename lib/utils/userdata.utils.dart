abstract class UserDataUtils {
  static String getChannelImage() => getUserImage('');

  static getUserImage(String? value) =>
      'https://ui-avatars.com/api/?name=$value&background=blue';
}
