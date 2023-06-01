import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setUsername(String value) async {
    return await _prefs.setString('username', value);
  }

  static Future<bool> setPassword(String value) async {
    return await _prefs.setString('password', value);
  }

  static String get username => _prefs.getString('username') ?? '';
  static String get password => _prefs.getString('password') ?? '';
}
