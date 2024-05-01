import 'package:flutter/material.dart';
import 'package:mi_agro_app/Resources/WidgetStyles.dart';
import '../Controllers/InformationController.dart';
import '../Resources/LabelConfiguration.dart';
import 'PartialPage/AppBarPartialPage.dart';

class InformationPage extends StatefulWidget {
  final InformationController controller;

  const InformationPage({super.key, required this.controller});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarPage(LabelConfiguration.information_title_appbar, context),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                height: 60,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/farmingType'),
                  style: WidgetStyles.ButtonWhiteColor,
                  child: Text(LabelConfiguration.information_Types_crops),
                ),
                ),
                const SizedBox(height: 20),
                 Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/fertilizerType'),
                    style: WidgetStyles.ButtonWhiteColor,
                    child: Text(LabelConfiguration.information_Fertilizer),
                ),
                ),
                const SizedBox(height: 20),
                 Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/'),
                    style: WidgetStyles.ButtonWhiteColor,
                    child: Text(LabelConfiguration.information_Instructions),
                ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
