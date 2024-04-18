import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarPage(LabelConfiguration.myfarming_Cultivation_diary_title_appbar, context),
          Expanded(child: ListView(
            children: [
              myNoteCard()
            ],
          )),
          Column(
            children: [
              Container(
                height: 60,
                width: double.maxFinite,
                margin: EdgeInsets.all(ViewConfiguration.PaddingContainer),
                child: ElevatedButton(
                    onPressed: null,
                    style: WidgetStyles.ButtonSynchronize,
                    child: Text(LabelConfiguration.myfarming_Cultivation_diary_new_note_button)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget myNoteCard() {
    double imageSize = 30;
    return InkWell(
      onTap: (){
        print(3);
        Navigator.pushNamed(context, '/myFarming/cultivationDiary');
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
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset("lib/Resources/Images/pencil.png", height: imageSize, width: imageSize),
                        SizedBox(width: 10),
                        const Text("Cultivo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green))
                      ],
                    ),
                    const Text("Fecha",
                        style: TextStyle(
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
