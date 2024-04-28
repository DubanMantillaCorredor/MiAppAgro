import 'package:flutter/material.dart';

import '../../Controllers/MyFarming/FormNoteComtroller.dart';
import '../../Resources/LabelConfiguration.dart';
import '../../Resources/WidgetStyles.dart';
import '../PartialPage/AppBarPartialPage.dart';
import '../ViewConfiguration.dart';

class FormNotesPage extends StatefulWidget {
  final FormNoteController controller;

  const FormNotesPage({super.key, required this.controller});

  @override
  State<FormNotesPage> createState() => _FormNotesPageState();
}

class _FormNotesPageState extends State<FormNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarPage("Notas", context),
          Column(
            children: [
              Text("Papa",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900)),
               Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: const Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration.collapsed(hintText: "Escriba sus notas"),
                          ),
                        )
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    margin: EdgeInsets.all(ViewConfiguration.PaddingContainer),
                    child: ElevatedButton(
                        onPressed: (){
                        },
                        style: WidgetStyles.ButtonSynchronize,
                        child: Text(LabelConfiguration.save_button)),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
