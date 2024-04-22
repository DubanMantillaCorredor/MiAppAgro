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
            title: Text('Valor del nitrógeno calculado: $nitrogenValue'),
          ),
          ...nutrientValues.entries.map((entry) {
            return ListTile(
              title: Text('Valor de ${entry.key} calculado: ${entry.value}'),
            );
          }).toList(),
        ],
      ),
    );
  }
}
