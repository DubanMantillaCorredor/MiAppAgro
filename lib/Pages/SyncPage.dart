import 'package:flutter/material.dart';
import 'package:mi_agro_app/Controllers/SyncController.dart';

class SyncPage extends StatefulWidget {
  final SyncController controller;

  const SyncPage({super.key, required this.controller});

  @override
  State<SyncPage> createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> {
  bool sendingRequest = false;
  bool showBackButton = false;

  @override
  void initState() {
    super.initState();
    SyncData();
  }

  SyncData() async {
    if(sendingRequest == true){
      return;
    }

    sendingRequest = true;

    var result = await widget.controller.syncData();
    showBackButton = true;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 300),
        const Center(child: Text("Sincronización", style: TextStyle(fontSize: 30))),
        const SizedBox(height: 20),
        Visibility(visible: !this.showBackButton, child: const CircularProgressIndicator()),
        Visibility(visible: this.showBackButton, child: Text("Ha finalizado", style: TextStyle(fontSize: 25))),
        const SizedBox(height: 20),
        Visibility(visible: this.showBackButton, child: ElevatedButton(
          child: Text("Salir"),
          onPressed: (){
            Navigator.pop(context);
          },
        ))

      ],
    ));
  }
}
