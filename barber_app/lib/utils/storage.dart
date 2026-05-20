import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future<void> store(String key, String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  static Future<Object?> index(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }
}