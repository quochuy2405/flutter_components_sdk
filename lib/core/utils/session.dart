import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static Future<void> setSession(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String?> getSession(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> removeSession(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static Future<void> clearAllSessions() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
