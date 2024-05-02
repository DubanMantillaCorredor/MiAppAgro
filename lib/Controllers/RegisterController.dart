import 'package:flutter/material.dart';
import 'package:mi_agro_app/api/RegisAPI.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Models/UserRegisterDto.dart';
import '../Services/IUserService.dart';
import '../Services/UserService.dart';

class RegisterController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late RegisterAPI _registerAPI;
  late IUserService _userService;
  bool isRequest = false;
  bool thereWasRequest = false;

  final formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RegisterController() {
    _userService = UserService();
    _registerAPI = RegisterAPI(); // Instancia de la clase RegisterAPI
  }

  Future<void> register() async {
    if (isRequest == true) {
      return;
    }

    if(formKey.currentState?.validate() == true) {
      isRequest = true;

      final email = emailController.text;
      final password = passwordController.text;

      await _registerAPI.register(
          nombreController.text, email, password)
          .then((response) async {
        try {
          thereWasRequest = true;
          if (response.statusCode == 201) {
            UserRegisterDto user = UserRegisterDto(email, password);
            final SharedPreferences prefs = await _prefs;
            var json = jsonEncode(user.toJson());

            try {
              var value = await _userService.sendLogin(json);
              await prefs.setString('user', value.data);
            } catch (error) {
              throw error;
            }
          } else {
            print('Error al registrarse: ${response.body}');
          }
        } catch (e) {
          print('Error al realizar la solicitud: $e');
          throw e;
        }
      }).onError((error, stackTrace) {
        print('Error al realizar la solicitud: $error');
        throw Exception();
      }).whenComplete(() => isRequest = false);
    }
  }
}
