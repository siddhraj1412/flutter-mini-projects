import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static String name = '';
  static String email = '';
  static String password = '';
  static String branch = '';
  static String phoneNumber = '';
  static String city = '';
  static bool isLoggedIn = false;

  static Future<void> setUserData({
    required String userName,
    required String userEmail,
    required String userPassword,
    required String userBranch,
    required String userPhone,
    required String userCity,
    bool persist = true,
  }) async {
    name = userName;
    email = userEmail;
    password = userPassword;
    branch = userBranch;
    phoneNumber = userPhone;
    city = userCity;
    isLoggedIn = true;

    if (persist) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', name);
      await prefs.setString('user_email', email);
      await prefs.setString('user_password', password);
      await prefs.setString('user_branch', branch);
      await prefs.setString('user_phone', phoneNumber);
      await prefs.setString('user_city', city);
      await prefs.setBool('user_logged_in', true);
    }
  }

  static Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('user_name') ?? '';
    email = prefs.getString('user_email') ?? '';
    password = prefs.getString('user_password') ?? '';
    branch = prefs.getString('user_branch') ?? '';
    phoneNumber = prefs.getString('user_phone') ?? '';
    city = prefs.getString('user_city') ?? '';
    isLoggedIn = prefs.getBool('user_logged_in') ?? false;
  }

  static Future<void> logout() async {
    name = '';
    email = '';
    password = '';
    branch = '';
    phoneNumber = '';
    city = '';
    isLoggedIn = false;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_name');
    await prefs.remove('user_email');
    await prefs.remove('user_password');
    await prefs.remove('user_branch');
    await prefs.remove('user_phone');
    await prefs.remove('user_city');
    await prefs.setBool('user_logged_in', false);
  }
}
