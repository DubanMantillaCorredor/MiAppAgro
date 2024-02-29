import 'package:flutter/material.dart';

import '../Controllers/InitController.dart';

class InitPage extends StatefulWidget {
  final InitController controller;

  const InitPage({super.key, required this.controller});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
