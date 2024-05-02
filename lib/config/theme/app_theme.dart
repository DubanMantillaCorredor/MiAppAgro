import 'package:flutter/material.dart';

class AppTheme {
  getTheme() => ThemeData(
    scaffoldBackgroundColor: Color(0xFFE2F3F0),
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red, width: 1
          ),
        )),
  );
}