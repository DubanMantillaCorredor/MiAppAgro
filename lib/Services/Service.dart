import 'dart:convert';

import 'package:mi_agro_app/Models/LoginResponseDto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  final String _urlBase = "https://mi-app-agro-f8ace816d05c.herokuapp.com";
  String _urlRelative = "";

  set setUrlRelative(String url) {
    _urlRelative = url;
  }

  String get urlRelative => "$_urlBase/$_urlRelative";



  Service(){}

  Future<String> GetToken() async {
    try {
      final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      String json = prefs.getString("user") ?? "";

      if (json == "") {
        return "";
      } else {
        var user = LoginResponseDto.fromJson(
            jsonDecode(prefs!.getString('user') ?? ''));
        return user.token;
      }
    } catch (ex) {
      return "";
    }
  }
}