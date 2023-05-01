import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setMode(bool isLight) async{
    return await sharedPreferences.setBool('isLight', isLight);
  }

  static bool? getMode() {
    return sharedPreferences.getBool('isLight');
  }
}