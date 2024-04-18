import 'package:flutter/material.dart';
import '../../Controllers/MyFarming/MyFarmingController.dart';
import '../../Resources/LabelConfiguration.dart';
import '../../Resources/WidgetStyles.dart';
import '../PartialPage/AppBarPartialPage.dart';
import '../ViewConfiguration.dart';

class MyFarmingPage extends StatefulWidget {
  final MyFarmingController controller;

  const MyFarmingPage({super.key, required this.controller});

  @override
  State<MyFarmingPage> createState() => _MyFarmingPageState();
}

class _MyFarmingPageState extends State<MyFarmingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarPage(LabelConfiguration.myfarming_title_appbar, context),
          Expanded(child: ListView(
            children: [
              myFarmingCard()
            ],
          )),
          Container(
            height: 60,
            width: double.maxFinite,
            margin: EdgeInsets.all(ViewConfiguration.PaddingContainer),
            child: ElevatedButton(
                onPressed: null,
                style: WidgetStyles.ButtonSynchronize,
                child: Text(LabelConfiguration.myFarming_create_new_farming_button)),
          )
        ],
      ),
    );
  }

  Widget myFarmingCard() {
    double imageSize = 50;
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
                        Image.asset("lib/Resources/Images/tractor.png", height: imageSize, width: imageSize),
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
