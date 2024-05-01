import 'package:flutter/material.dart';
import 'package:mi_agro_app/api/RegisAPI.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late RegisterAPI _registerAPI;
  bool isRequest = false;
  bool thereWasRequest = false;

  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
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

    await _registerAPI.register(_nombreController.text, _emailController.text, _passwordController.text).then((response) {
      try {
        thereWasRequest = true;
        if (response.statusCode == 200) {
          Navigator.pushNamed(context, '/home'); // Utiliza el contexto proporcionado
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
