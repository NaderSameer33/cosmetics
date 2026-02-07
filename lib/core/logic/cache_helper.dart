import 'package:cosmentics/views/auth/login.dart';
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

  static bool isAuth() {
    return (_preferences.getString('token') ?? '').isNotEmpty;
  }

  static Future<void> saveUserData(UserData userData) async {
    _preferences.setString('email', userData.userModel.email);
    _preferences.setInt('id', userData.userModel.id);
    _preferences.setString('phoneNumber', userData.userModel.phoneNumber);
    _preferences.setString('role', userData.userModel.role);
    _preferences.setString('userName', userData.userModel.userName);
    _preferences.setString('profileImage', userData.userModel.profileImage);
    _preferences.setString('token', userData.token);
  }
}
