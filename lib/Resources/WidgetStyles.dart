import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetStyles {
  static ButtonStyle ButtonGrayColor = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      elevation: MaterialStateProperty.all(5),
      foregroundColor: MaterialStateProperty.all(Colors.green.shade900),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)));

  static ButtonStyle ButtonSynchronize = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.green),
      elevation: MaterialStateProperty.all(5),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)));

  static ButtonStyle ButtonGreenColor = ButtonStyle(
      backgroundColor:MaterialStateProperty.all(Color.fromRGBO(133, 208, 40, 1)),
      elevation: MaterialStateProperty.all(5),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)));

  static ButtonStyle ButtonWhiteColor = ButtonStyle(
      backgroundColor:MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 1)),
      elevation: MaterialStateProperty.all(5),
      foregroundColor: MaterialStateProperty.all(Color(0xff4f7260)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)));
  
static ButtonStyle ButtonTypeFarming = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(133, 208, 40, 1)),
      elevation: MaterialStateProperty.all(5),
      foregroundColor: MaterialStateProperty.all(Color.fromRGBO(255, 255, 255, 1)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(50, 50)),
      );



}
