import 'package:flutter/material.dart';
import 'package:mi_agro_app/Models/Database/Todo.dart';

import '../../Controllers/MyFarming/CultivationDiaryController.dart';
import '../../Resources/LabelConfiguration.dart';
import '../../Resources/WidgetStyles.dart';
import '../PartialPage/AppBarPartialPage.dart';
import '../ViewConfiguration.dart';

class CultivationDiaryPage extends StatefulWidget {
  final CultivationDiaryController controller;

  const CultivationDiaryPage({super.key, required this.controller});

  @override
  State<CultivationDiaryPage> createState() => _CultivationDiaryPageState();
}

class _CultivationDiaryPageState extends State<CultivationDiaryPage> {
  late String farming_id = "";
  late String title = "";

  @override
  void initState() {
    super.initState();

  }

  void loadData(){
    print("Valor de carga 2: $widget.controller.isLoading");
    if(widget.controller.isLoading == false){
      print("Carga No la lista");
      return;
    }
    print("Carga la lista");
    widget.controller.isLoading = false;
    widget.controller.GetList(farming_id).then((value) {
      print(widget.controller.listOfNotes.length);
      setState(() {
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    this.farming_id = arguments['farming_id'];
    this.title = arguments['title'];
    widget.controller.farmingId = farming_id;
    loadData();

    return Scaffold(
      body: Column(
        children: [
          AppBarPage(title, context),
          Expanded(
              child: ListView.builder(
            itemCount: widget.controller.listOfNotes.length,
            itemBuilder: (context, index) {
              return myNoteCard(widget.controller.listOfNotes[index]);
            },
          )),
          Column(
            children: [
              Container(
                height: 60,
                width: double.maxFinite,
                margin: EdgeInsets.all(ViewConfiguration.PaddingContainer),
                child: ElevatedButton(
                    onPressed: () async {
                      var data = await Navigator.pushNamed(context, '/formNote', arguments: {
                        "farming_id": farming_id,
                        "title": title
                      });
                      if(data != null){
                        widget.controller.isLoading = true;
                        loadData();
                      }
                    },
                    style: WidgetStyles.ButtonSynchronize,
                    child: Text(LabelConfiguration
                        .myfarming_Cultivation_diary_new_note_button)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget myNoteCard(Todo value) {
    double imageSize = 30;
    return InkWell(
      onTap: () async {
        var data = await Navigator.pushNamed(context, '/detailNote', arguments: {
          "id": value.id,
          "title": title
        });

        if(data != null){
          widget.controller.isLoading = true;
          loadData();
        }
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
        color: Colors.green.shade900,
        child: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                //height: 200,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset("lib/Resources/Images/pencil.png",
                            height: imageSize, width: imageSize),
                        SizedBox(width: 10),
                        Text(value.title,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green))
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Fecha ${value.getDatetime}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
