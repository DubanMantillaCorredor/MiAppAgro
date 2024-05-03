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

      if (response.statusCode >= 200 && response.statusCode < 300) {
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

class RegisterAPI {
  String registerPath = BaseAPI.base + "/signup";

  Future<http.Response> register(
      String nombre, String apellido,String email, String password) async {
    try {
      final data = jsonEncode({
        "user": {
          "first_name": nombre,
          "last_name": apellido,
          "email": email,
          "password": password,
        }
      });

      return await BaseAPI().post(registerPath, data);
    } catch (e) {
      print('Error en el registro: $e');
      rethrow;
    }
  }
}

class RegisterController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late RegisterAPI _registerAPI;
  bool isRequest = false;
  bool thereWasRequest = false;

  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  RegisterController() {
    _registerAPI = RegisterAPI(); // Instancia de la clase RegisterAPI
  }

  Future<void> register(BuildContext context) async {
    if (isRequest == true) {
      return;
    }

    isRequest = true;

    await _registerAPI
        .register(_nombreController.text, _apellidoController.text, _emailController.text,
            _passwordController.text)
        .then((response) {
      try {
        thereWasRequest = true;
        if (response.statusCode >= 200 && response.statusCode < 300) {
          Navigator.pushNamed(
              context, '/home'); // Utiliza el contexto proporcionado
        } else {
          // Mostrar mensaje de error al usuario
          print('Error al registrarse: ${response.body}');
        }
      } catch (e) {
        print('Error al realizar la solicitud: $e');
      }
    }).onError((error, stackTrace) {
      print('Error al realizar la solicitud: $error');
    }).whenComplete(() => isRequest = false);
  }
}
