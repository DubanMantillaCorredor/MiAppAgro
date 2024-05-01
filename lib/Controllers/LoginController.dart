import 'dart:convert';
import 'package:mi_agro_app/Models/ResponseHttpDto.dart';
import 'package:mi_agro_app/Models/UserRegisterDto.dart';
import 'package:mi_agro_app/Services/IUserService.dart';
import 'package:mi_agro_app/Services/UserService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  bool isRequest = false;
  bool thereWasRequest = false;
  late IUserService _userService;
  late Future<SharedPreferences> _prefs;

  LoginController() {
    _userService = UserService();
    _prefs = SharedPreferences.getInstance();
  }

  Future<bool> SendLogin(String email, String password) async {
    UserRegisterDto user = UserRegisterDto(email, password);
    final SharedPreferences prefs = await _prefs;
    var json = jsonEncode(user.toJson());

    try {
      var value = await _userService.sendLogin(json);
      await prefs.setString('user', value.data);
      print("Valida 1");
      return true;
    } catch (error) {
      print("Valida 2");
      throw error;
    }
  }

}
