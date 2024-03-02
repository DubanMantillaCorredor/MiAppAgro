import 'package:flutter/material.dart';
import '../Controllers/HomeController.dart';
import '../Resources/LabelConfiguration.dart';
import '../Resources/WidgetStyles.dart';
import 'ViewConfiguration.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('lib/Resources/Images/F4V.png'),
          ),
          Expanded(child: Container(
            padding: EdgeInsets.all(ViewConfiguration.PaddingContainer),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/myFarming'),
                      style: WidgetStyles.ButtonGrayColor,
                      child: Text(LabelConfiguration.home_my_farming)),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  height: 60,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/calculateFertilizer'),
                      style: WidgetStyles.ButtonGrayColor,
                      child: Text(LabelConfiguration.home_calculator)),
                ),
                Container(
                  height: 60,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/information'),
                      style: WidgetStyles.ButtonGrayColor,
                      child: Text(LabelConfiguration.home_information)),
                ),
              ],
            ),
          )),
          Container(
            height: 60,
            width: double.maxFinite,
            margin: EdgeInsets.all(ViewConfiguration.PaddingContainer),
            child: ElevatedButton(
                onPressed: null,
                style: WidgetStyles.ButtonSynchronize,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(LabelConfiguration.home_synchronize),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: 20,
                      child: Image.asset("lib/Resources/Images/loading-arrows.png"),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
