import 'package:flutter/material.dart';
import '../Controllers/CalculateFertilizerController.dart';
import '../Resources/LabelConfiguration.dart';
import '../Resources/WidgetStyles.dart';
import 'PartialPage/AppBarPartialPage.dart';
import 'ViewConfiguration.dart';

class CalculateFertilizerPage extends StatefulWidget {
  final CalculateFertilizerController controller;

  const CalculateFertilizerPage({super.key, required this.controller});

  @override
  State<CalculateFertilizerPage> createState() =>
      _CalculateFertilizerPageState();
}

class _CalculateFertilizerPageState extends State<CalculateFertilizerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarPage(
              LabelConfiguration.calculatefertilizer_title_appbar, context),
          ...nutrients(),
          Card(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            color: Colors.green.shade900,
            child: Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    //height: 200,
                    color: Colors.white,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Área de cultivo",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cantidad metros cuadrados", style: TextStyle(fontSize: 16, color: Colors.green),),
                            SizedBox(height: 5),
                            TextField(decoration: InputDecoration(hintText: "Ingresa una cantidad"))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 60,
            width: double.maxFinite,
            margin: EdgeInsets.all(ViewConfiguration.PaddingContainer),
            child: ElevatedButton(
                onPressed: null,
                style: WidgetStyles.ButtonSynchronize,
                child: Text(LabelConfiguration.calculatefertilizer_button_title)),
          )
        ],
      ),
    );
  }

  List<Widget> nutrients() {
    var lista = [
      "Nitrogeno",
      "Fosforo",
      "Potasio",
      "Calcio",
      "Azufre",
      "Magnecio"
    ];

    return lista.map((e) {
      return Card(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(LabelConfiguration.calculatefertilizer_it_is_oxidation, style: TextStyle(fontSize: 16),),
                        Switch(value: false, onChanged: (bool value) {  },)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(LabelConfiguration.calculatefertilizer_ppm_amount, style: TextStyle(fontSize: 16, color: Colors.green),),
                        SizedBox(height: 5),
                        const TextField(decoration: InputDecoration(hintText: "Ingresa una cantidad"))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}
