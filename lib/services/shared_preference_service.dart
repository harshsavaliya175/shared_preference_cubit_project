import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static SharedPreferences? _preferences;

  static Future<void> inIt() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setValue({required String key, dynamic value}) async {
    if (value is String) {
      return await _preferences!.setString(key, value);
    } else if (value is bool) {
      return await _preferences!.setBool(key, value);
    } else if (value is int) {
      return await _preferences!.setInt(key, value);
    } else if (value is double) {
      return await _preferences!.setDouble(key, value);
    } else if (value is List<String>) {
      return await _preferences!.setStringList(key, value);
    } else {
      return false;
    }
  }

  static String getString(String key) {
    return _preferences?.getString(key) ?? '';
  }

  static int getInt(String key) {
    return _preferences?.getInt(key) ?? 0;
  }

  static bool getBool(String key) {
    return _preferences?.getBool(key) ?? false;
  }

  static double getDouble(String key) {
    return _preferences?.getDouble(key) ?? 0;
  }

  static List<String> getListOfString(String key) {
    return _preferences?.getStringList(key) ?? [];
  }
}
