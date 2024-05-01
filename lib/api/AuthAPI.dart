import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseAPI {
  static String base = "https://mi-app-agro-f8ace816d05c.herokuapp.com";

  Future<http.Response> post(String path, String data) async {
    var url = Uri.parse(path);
    try {
      var response = await http
          .post(url, body: data, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        // Procesa la respuesta exitosa aquí
        return response;
      } else {
        // Maneja errores o respuestas no exitosas
        throw Exception(
            'Error en la solicitud: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    }
  }
}

class AuthAPI {
  String authPath = BaseAPI.base + "/login";

  Future<http.Response> login(String email, String password) async {
    try {
      final data = jsonEncode({
        "user": {
          "email": email,
          "password": password,
        }
      });

      return await BaseAPI().post(authPath, data);
    } catch (e) {
      print('Error en el inicio de sesión: $e');
      rethrow;
    }
  }
}

class LoginController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late AuthAPI _authAPI;
  bool isRequest = false;
  bool thereWasRequest = false;

  LoginController() {
    _authAPI = AuthAPI(); // Instancia de la clase AuthAPI
  }

  Future<void> login(String email, String password, BuildContext context) async {
    if (isRequest == true) {
      return;
    }

    isRequest = true;

    await _authAPI.login(email, password).then((response) {
      try {
        thereWasRequest = true;
        if (response.statusCode == 200) {
          Navigator.pushNamed(context, '/home'); // Utiliza el contexto proporcionado
        } else {
          // Mostrar mensaje de error al usuario
          print('Error al iniciar sesión: ${response.body}');
        }
      } catch (e) {
        print('Error al realizar la solicitud: $e');
      }
    }).onError((error, stackTrace) {
      print('Error al realizar la solicitud: $error');
    }).whenComplete(() => isRequest = false);
  }
}
