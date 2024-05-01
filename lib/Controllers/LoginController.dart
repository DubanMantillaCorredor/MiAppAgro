import 'package:flutter/material.dart';
import 'package:mi_agro_app/api/AuthAPI.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Asegúrate de importar el paquete necesario

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