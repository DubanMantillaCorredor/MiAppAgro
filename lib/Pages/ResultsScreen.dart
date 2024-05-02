import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final double nitrogenValue;
  final Map<String, double> nutrientValues;

  const ResultsScreen({
    Key? key,
    required this.nitrogenValue,
    required this.nutrientValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Cantidad de Urea requerida: $nitrogenValue Kg'),
          ),
          ...nutrientValues.entries.map((entry) {
            return ListTile(
              title: Text('Cantidad de ${_castName(entry.key)} requerido: ${entry.value} Kg'),
            );
          }).toList(),
        ],
      ),
    );
  }

  String _castName(String name) {
    switch(name) {
      case 'Fosforo': return "Superfosfato triple";
      case 'Potasio': return "Cloruro de potasio";
      case 'Calcio': return "Cal viva";
      case 'Azufre': return "Volcan S-90";
      case 'Magnesio': return "Sili-Magnesio";
    }
    return '';
  }

}
