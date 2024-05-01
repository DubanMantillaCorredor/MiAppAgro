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
          Expanded(
              child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                      child: farmingCard(
                          "Papa",
                          "lib/Resources/Images/potato.png",
                          "31bfea98-78cf-4515-9e8d-270db6a51641")),
                  Expanded(
                      child: farmingCard(
                          "Cebolla",
                          "lib/Resources/Images/onion.png",
                          "a455ac77-03e6-4ae7-9dde-a1206850bd6a")),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget farmingCard(String title, String image, String farming_id) {
    return Card(
      color: Colors.white,
      child: InkWell(
          onTap: () {
            Navigator.pushNamed(
                context, '/cultivationDiary',
                arguments: {
                  "farming_id": farming_id,
                  "title": title
                }
            );
          },
          child: Container(
            height: 200,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(title), SizedBox(height: 10), Image.asset(image)],
            ),
          )),
    );
  }
}
