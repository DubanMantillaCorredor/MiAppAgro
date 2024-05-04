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
  final TextEditingController _titleInput = TextEditingController();
  final TextEditingController _bodyInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String title = "";


  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute
        .of(context)
        ?.settings
        .arguments ?? <String, dynamic>{}) as Map;
    widget.controller.farming_id = arguments['farming_id'] ?? "";
    title = arguments['title'] ?? "";

    return Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            child: ListView(
              children: [
                AppBarPage("Notas", context),
                Center(
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900)),
                ),
                Form(
                    key: _formKey,
                    child:Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Título", style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _titleInput,
                            validator: (text){
                              if (text == null || text.isEmpty) {
                                return "*Debes ingresar un título";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          Container(
                              color: Colors.white,
                              child: TextFormField(
                                controller: _bodyInput,
                                maxLines: 8,
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(8.0),
                                  hintText: "Escriba sus notas",
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              )
                          ),
                          Container(
                            height: 60,
                            width: double.maxFinite,
                            margin: EdgeInsets.all(ViewConfiguration.PaddingContainer),
                            child: ElevatedButton (
                                onPressed: () async{
                                  if (_formKey.currentState!.validate()){
                                    var result = await widget.controller.saveNote(_titleInput.text, _bodyInput.text);
                                    Navigator.pop(context, true);
                                  }
                                },
                                style: WidgetStyles.ButtonSynchronize,
                                child: Text(LabelConfiguration.save_button)),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        )
    );
  }
}
