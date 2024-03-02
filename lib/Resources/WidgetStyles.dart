import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetStyles {
  static ButtonStyle ButtonGrayColor = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      elevation: MaterialStateProperty.all(5),
      foregroundColor: MaterialStateProperty.all(Colors.green.shade900),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
  );

  static ButtonStyle ButtonSynchronize = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.green),
      elevation: MaterialStateProperty.all(5),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
  );

}