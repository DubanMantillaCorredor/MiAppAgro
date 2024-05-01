import 'package:flutter/material.dart';
import 'package:mi_agro_app/Controllers/MyFarming/DetailNoteController.dart';
import 'package:mi_agro_app/Pages/PartialPage/AppBarPartialPage.dart';
import 'package:mi_agro_app/Resources/LabelConfiguration.dart';
import 'package:mi_agro_app/Resources/WidgetStyles.dart';



class DetailNotePage extends StatefulWidget {
  final DetailNoteController controller;

  const DetailNotePage({super.key, required this.controller});

  @override
  State<DetailNotePage> createState() => _DetailNotePageState();
}

class _DetailNotePageState extends State<DetailNotePage> {
  String id = "";
  String title = "";

  void loadData(){
    if(widget.controller.isLoading == false){
      return;
    }
    widget.controller.isLoading = false;
    widget.controller.fechById(id).then((value) {
      setState(() {
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute
        .of(context)
        ?.settings
        .arguments ?? <String, dynamic>{}) as Map;
    this.id = arguments['id'];
    this.title = arguments['title'];

    loadData();

    return Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            child: ListView(
              children: [
                AppBarPage(title, context),
                Center(
                  child: Text("Papa",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900)),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Text(widget.controller.todo?.title ?? ""),
                ),
                //SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Text(widget.controller.todo?.body ?? ""),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: (){
                        widget.controller.deleteRow(id: this.id).then((value){
                          Navigator.pop(context, value);
                        });
                      },
                      style: WidgetStyles.ButtonDelete,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(LabelConfiguration.delete_button),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            width: 20,
                            child: Image.asset("lib/Resources/Images/trash.png"),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        )
    );
  }
}
