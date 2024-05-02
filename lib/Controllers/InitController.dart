
import 'package:shared_preferences/shared_preferences.dart';

class InitController {

  late Future<SharedPreferences> _prefs;

  InitController(){
    _prefs = SharedPreferences.getInstance();
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('user') != null;
  }
}