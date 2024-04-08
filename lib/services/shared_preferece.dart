
import 'package:amp_up/imports.dart';

class CustomSharedPreference {
  static SharedPreferences? _prefs;

  CustomSharedPreference() {
    _initializePrefs();
  }

  Future<void> _initializePrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _initializePrefs();
    _prefs!.setString(key, value);
  }

  String? getString(String key) {
    if (_prefs != null) {
      return _prefs!.getString(key);
    }
    return null; }
}
