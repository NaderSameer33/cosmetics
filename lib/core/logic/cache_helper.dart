import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _preferences;
 static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setIsFirstTime() async {
    await _preferences.setBool('isFirst', false);
  }

  static bool getIsFirstTime() {
    return _preferences.getBool('isFirst') ?? true;
  }
}
