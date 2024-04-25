import 'package:flutter/material.dart';
import 'package:mi_agro_app/Controllers/FertilizerTypeController.dart';
import 'package:mi_agro_app/Models/Calculador/Nutrientes.dart';
import 'package:mi_agro_app/Resources/WidgetStyles.dart';
import '../Controllers/FarmingTypeController.dart';
import '../Models/Calculador/Nutrientes.dart';

class FertilizerTypePage extends StatefulWidget {
  final FertilizerTypeController controller;

  const FertilizerTypePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<FertilizerTypePage> createState() => _FertilizerTypePageState();
}

class _FertilizerTypePageState extends State<FertilizerTypePage> {
  // Lista de productos
  List<Productos> productos = [
    Urea(),
    CloruroPotasio(),
    CalViva(),
    SiliMagnesio(),
    SuperFosfatoTriple(),
    VolcanS90(),
  ];

  // Función para mostrar la tarjeta con el título y la descripción
  void _showInfoDialog(String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Tipos De Fertilizantes")),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: productos.map((producto) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  height: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _showInfoDialog(
                        producto.titulo,
                        producto.descripcion,
                      );
                    },
                    child: Text(producto.titulo),
                    style: WidgetStyles.ButtonGreenColor,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}