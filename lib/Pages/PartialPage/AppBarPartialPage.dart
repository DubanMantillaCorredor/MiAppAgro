import 'package:flutter/material.dart';

Widget AppBarPage(String title, BuildContext context){
  return Stack(
    children: <Widget>[
      Image.asset(
        'lib/Resources/Images/F4V.png',
        fit: BoxFit.fill,
      ),
      Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child:
                    Image.asset("lib/Resources/Images/arrow_left.png"),
                  ),
                  SizedBox(width: 10),
                  Text(title,
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

