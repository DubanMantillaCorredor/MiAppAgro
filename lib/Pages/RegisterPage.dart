import 'package:flutter/material.dart';
import 'package:mi_agro_app/Pages/algo.dart';
import 'package:mi_agro_app/Resources/LabelConfiguration.dart';
import 'package:mi_agro_app/Resources/WidgetStyles.dart';
import '../Controllers/RegisterController.dart';

class RegisterPage extends StatefulWidget {
  final RegisterController controller;

  const RegisterPage({super.key, required this.controller});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {

    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    );

    const textFieldDecoration = InputDecoration(
      fillColor: Colors.transparent,
      filled: true,
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      labelStyle: TextStyle(color: Colors.grey),
    );

    return GestureDetector(
      onTap: () {
        // Ocultar teclado cuando se toca fuera de los campos de entrada
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
            child: Form(
              key: widget.controller.formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Registrate',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Color(0xff1b4931),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Ingresa tu información personal',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff1b4931),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Usuario',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff1b4931),
                  ),
                ),
                TextFormField(
                  controller: widget.controller.nombreController,
                  decoration: textFieldDecoration.copyWith(labelText: 'Ingresa tu nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Email',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff1b4931),
                  ),
                ),
                TextFormField(
                  controller: widget.controller.emailController,
                  decoration: textFieldDecoration.copyWith(labelText: 'Correo electrónico'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su correo electrónico';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contraseña',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff1b4931),
                  ),
                ),
                TextFormField(
                  controller: widget.controller.passwordController,
                  decoration: textFieldDecoration.copyWith(labelText: 'Crea tu contraseña'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese tu contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Confirma tu contraseña',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff1b4931),
                  ),
                ),
                TextFormField(
                  controller: widget.controller.confirmPasswordController,
                  decoration: textFieldDecoration.copyWith(labelText: 'Confirma tu contraseña'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, confirma tu contraseña';
                    } else if (value != widget.controller.passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.controller.register().then((value) {
                        Navigator.pushNamed(context, '/home');
                      }).catchError((error){
                        alerts();
                      });
                    },
                    style: WidgetStyles.ButtonGreenColor,
                    child: Text(LabelConfiguration.init_Pages_Register),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }

  Future alerts (){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Atención'),
            content: const Text('Este correo ya se encuentra registrado'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          );
        }
    );
  }
}
