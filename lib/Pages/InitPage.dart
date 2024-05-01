import 'package:flutter/material.dart';
import 'package:mi_agro_app/Controllers/InitController.dart';
import 'package:mi_agro_app/Resources/LabelConfiguration.dart';
import 'package:mi_agro_app/Resources/WidgetStyles.dart';

class InitPage extends StatefulWidget {
  final InitController controller;

  const InitPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/Resources/Images/FondoInicio.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              height: 60,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: WidgetStyles.ButtonWhiteColor,
                child: Text(LabelConfiguration.init_Pages_Ini_Sesion),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              height: 60,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                style: WidgetStyles.ButtonGreenColor,
                child: Text(LabelConfiguration.init_Pages_Register),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
