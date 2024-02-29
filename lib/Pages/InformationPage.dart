import 'package:flutter/material.dart';
import '../Controllers/InformationController.dart';

class InformationPage extends StatefulWidget {
  final InformationController controller;

  const InformationPage({super.key, required this.controller});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
