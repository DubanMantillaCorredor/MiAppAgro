import 'package:flutter/material.dart';
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
      body: ListView(
        children: [
          AppBarPage(LabelConfiguration.information_title_appbar, context)
        ],
      ),
    );
  }
}
