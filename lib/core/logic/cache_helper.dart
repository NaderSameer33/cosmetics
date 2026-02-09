import '../../views/auth/login.dart';
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

  static String get getToken {
    return _preferences.getString('token') ?? '';
  }

  static String get getUserName {
    return _preferences.getString('userName') ?? '';
  }

  static bool isAuth() {
    return getToken.isNotEmpty;
  }

  static Future<void> saveUserData({
    UserData? userData,
    UserModel? userModel,
  }) async { 
    if (userData == null && userModel == null) return; 
    if (userData != null) {
      _preferences.setString('token', userData.token);
      userModel = userData.userModel ;
    }
    if (userModel != null) {
      _preferences.setString('email', userModel.email); 
      _preferences.setInt('id', userModel.id);
      _preferences.setString('phoneNumber', userModel.phoneNumber);
      _preferences.setString('role', userModel.role);
      _preferences.setString('userName', userModel.userName);
      _preferences.setString('profileImage', userModel.profileImage);
    }
  }

  static void logOut() async {
    _preferences.remove('token');
    _preferences.remove('id');
    _preferences.remove('phoneNumber');
    _preferences.remove('role');
    _preferences.remove('userName');
    _preferences.remove('email');
    _preferences.remove('profileImage');
  }

  static String get getProfileImage {
    return _preferences.getString('profileImage') ?? '';
  }

  static String get phoneNumber {
    return _preferences.getString('phoneNumber') ??'' ; 
  }
}
