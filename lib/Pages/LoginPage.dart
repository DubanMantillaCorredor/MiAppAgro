import 'package:flutter/material.dart';
import 'package:mi_agro_app/Pages/algo.dart';
import 'package:mi_agro_app/Resources/LabelConfiguration.dart';
import 'package:mi_agro_app/Resources/WidgetStyles.dart';
import '../Controllers/LoginController.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;

  const LoginPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); //ocultar teclado
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              Image.asset('lib/Resources/Images/User.png', height: 150),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Inicio De sesión',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff1b4931),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Ingresa para continuar usando la app',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff1b4931),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff1b4931),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',

                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese su correo electrónico';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Contraseña',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff1b4931),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Ingresa tu contraseña',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese tu contraseña';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()){
                      widget.controller.SendLogin(_emailController.text, _passwordController.text).then((value) {
                        print("Trae");
                        print(value);
                        if(value == true){
                          Navigator.pushNamed(context, '/home');
                        }else{
                          alerts();
                        }
                      }).catchError((error){
                        alerts();
                      });
                    }
                  },
                  style: WidgetStyles.ButtonGreenColor,
                  child: Text(LabelConfiguration.init_Pages_Ini_Sesion),
                ),
              )              ,
              TextButton(
                child: const Text(
                  '¿Eres un nuevo usuario? Regístrate',
                  style: TextStyle(
                    color: Color(0xff2f5a44),
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus(); // Oculta el teclado
                  Navigator.pushNamed(context, '/register');
                },
              ),
              const SizedBox(height: 20), // Espacio adicional al final
            ],
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
            content: const Text('Usuario o contraseña incorrecta'),
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
