import 'package:flutter/material.dart';
import 'package:mi_agro_app/api/AuthAPI.dart'; // Asegúrate de importar el paquete necesario

class LoginController {
  final AuthAPI _authAPI = AuthAPI(); // Instancia de la clase AuthAPI

  Future<void> login(String email, String password, BuildContext context) async {
    try {
      final response = await _authAPI.login(email, password);
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/home'); // Utiliza el contexto proporcionado
      } else {
        // Mostrar mensaje de error al usuario
        print('Error al iniciar sesión: ${response.body}');
      }
    } catch (e) {
      print('Error al realizar la solicitud: $e');
    }
  }
}
