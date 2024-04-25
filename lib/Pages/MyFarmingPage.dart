
import 'package:flutter/material.dart';
import 'package:mi_agro_app/Controllers/MyFarming/MyFarmingController.dart';
import '../Resources/LabelConfiguration.dart';
import 'PartialPage/AppBarPartialPage.dart';

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
      body: ListView(
        children: [
          AppBarPage(LabelConfiguration.myfarming_title_appbar, context)
        ],
      ),
    );
  }
}
