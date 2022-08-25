import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {
  static late SharedPreferences prefs;

  static Future<SharedPreferences> init() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
