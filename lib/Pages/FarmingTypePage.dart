import 'package:flutter/material.dart';
import '../Controllers/FarmingTypeController.dart';
import 'PartialPage/AppBarPartialPage.dart';

class FarmingTypePage extends StatefulWidget {
  final FarmingTypeController controller;

  const FarmingTypePage({super.key, required this.controller});

  @override
  State<FarmingTypePage> createState() => _FarmingTypePageState();
}

class _FarmingTypePageState extends State<FarmingTypePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
