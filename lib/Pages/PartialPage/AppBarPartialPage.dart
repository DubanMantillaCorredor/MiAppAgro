import 'package:flutter/material.dart';

Widget AppBarPage(String title, BuildContext context) {
  return Stack(
    children: <Widget>[
      Image.asset(
        'lib/Resources/Images/F4V.png',
        fit: BoxFit.fill,
      ),
      Positioned.fill(
          child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset("lib/Resources/Images/arrow_left.png"),
              ),
              const SizedBox(width: 10),
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900)),
            ],
          ),
        ),
      ))
    ],
  );
}
