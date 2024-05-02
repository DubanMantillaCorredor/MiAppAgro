import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mi_agro_app/Models/Calculador/GeneralCropCalculator.dart';
import 'package:mi_agro_app/Pages/PartialPage/AppBarPartialPage.dart';
import 'package:mi_agro_app/Pages/ResultsScreen.dart';
import 'package:mi_agro_app/Resources/LabelConfiguration.dart';
import '../Controllers/CalculateFertilizerController.dart';

class CalculateFertilizerPage extends StatefulWidget {
  final CalculateFertilizerController controller;

  const CalculateFertilizerPage({Key? key, required this.controller})
      : super(key: key);

  @override
  State<CalculateFertilizerPage> createState() =>
      _CalculateFertilizerPageState();
}

class _CalculateFertilizerPageState extends State<CalculateFertilizerPage> {
  late double fertilizerDensity;
  late String selectedCropText;
  late Calculator? selectedCalculator;

  final Map<String, double> nutrientValues = {
    'Nitrógeno': 0.0,
    'Fosforo': 0.0,
    'Potasio': 0.0,
    'Calcio': 0.0,
    'Azufre': 0.0,
    'Magnesio': 0.0,
  };

  final TextEditingController densityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fertilizerDensity = 0.0;
    selectedCropText = 'Papa';
    selectedCalculator = PapaCalculadora();
  }

  @override
  void dispose() {
    densityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> calculators = [
      {'name': 'Papa', 'value': 0.25, 'calculator': PapaCalculadora()},
      {'name': 'Cebolla', 'value': 0.10, 'calculator': CebollaCalculadora()},
    ];
    return Scaffold(
      body: ListView(children: [
        AppBarPage(
            LabelConfiguration.calculatefertilizer_title_appbar, context),
        Card(
          margin: EdgeInsets.fromLTRB(5, 0, 10, 10),
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              DataTable(
                columns: const [
                  DataColumn(
                      label: Text('Nutrientes',
                          style: TextStyle(color: Colors.green))),
                  DataColumn(
                      label: Text('Cantidad en análisis',
                          style: TextStyle(color: Colors.green))),
                ],
                rows: nutrientValues.entries.map((entry) {
                  final String nutrientName = entry.key;
                  return DataRow(cells: [
                    DataCell(Text(nutrientName)),
                    DataCell(
                      TextFormField(
                        onTap: () {
                          setState(() {
                            nutrientValues[nutrientName] = 0.0;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            nutrientValues[nutrientName] =
                                double.tryParse(value) ?? 0.0;
                          });
                        },
                        initialValue: nutrientValues[nutrientName] == 0.0
                            ? ''
                            : nutrientValues[nutrientName].toString(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: densityController,
                onTap: () {
                  setState(() {
                    fertilizerDensity = 0.0;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    fertilizerDensity = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Densidad Aparente (g/cm3)',
                  labelStyle: const TextStyle(color: Colors.green),
                  contentPadding: const EdgeInsets.all(16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              DropdownButton<double>(
                value: selectedCalculator?.profundidadCultivo,
                onChanged: (value) {
                  setState(() {
                    selectedCalculator = value == null
                        ? null
                        : calculators.firstWhere((calculator) =>
                            calculator['value'] == value)['calculator'];
                    selectedCropText = selectedCalculator == null
                        ? 'Seleccionar cultivo'
                        : selectedCalculator.toString();
                  });
                },
                items: calculators
                    .map<DropdownMenuItem<double>>(
                        (calculator) => DropdownMenuItem<double>(
                              value: calculator['value'],
                              child: Text(calculator['name']),
                            ))
                    .toList(),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: isDataComplete() ? calcularYMostrarResultados : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Calcular',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        )
      ]),
    );
  }

  double calculateNitrogen(double userNitrogenInput, double userDensityInput,
      double selectedCropDepth) {
    double baseNitrogenValue =
        selectedCalculator?.nutrientValues['Nitrógeno'] ?? 0.0;
    double result = baseNitrogenValue -
        (userNitrogenInput * userDensityInput * selectedCropDepth * 1000);
    return result;
  }

  double? calculateNutrient(double userInput, double userDensityInput,
      double selectedCropDepth, double baseNutrientValue, String nutrientName) {
    if (nutrientName == 'Nitrógeno') {
      return null;
    } else {
      double result = baseNutrientValue -
          (userInput * userDensityInput * selectedCropDepth * 10);
      if (result < 0) {
        result = 0;
      }
      return result;
    }
  }

  double realizarOperacion(String nutrientName, double value) {
    switch (nutrientName) {
      case 'Nitrógeno':
        return ((100 * value) / 46).roundToDouble();
      case 'Fosforo':
        return ((100 * value) / 46).roundToDouble();
      case 'Potasio':
        return ((100 * value) / 60).roundToDouble();
      case 'Calcio':
        return ((100 * value) / 68).roundToDouble();
      case 'Azufre':
        return ((100 * value) / 90).roundToDouble();
      case 'Magnesio':
        return ((100 * value) / 32).roundToDouble();
      default:
        return value;
    }
  }

  void calcularYMostrarResultados() {
    double nitrogenValue = calculateNitrogen(
      nutrientValues['Nitrógeno'] ?? 0.0,
      fertilizerDensity,
      selectedCalculator!.profundidadCultivo,
    );

    double modifiedNitrogenValue =
        realizarOperacion('Nitrógeno', nitrogenValue);

    Map<String, double> calculatedNutrients = {};
    nutrientValues.forEach((key, value) {
      double? nutrientValue = calculateNutrient(
        value,
        fertilizerDensity,
        selectedCalculator!.profundidadCultivo,
        selectedCalculator!.nutrientValues[key] ?? 0.0,
        key,
      );
      if (nutrientValue != null) {
        double modifiedNutrientValue = realizarOperacion(key, nutrientValue);
        calculatedNutrients[key] = modifiedNutrientValue;
      }
    });

    print('Valor de nitrógeno modificado: $modifiedNitrogenValue');
    calculatedNutrients.forEach((key, value) {
      print('Valor de $key modificado: $value');
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          nitrogenValue: (modifiedNitrogenValue < 0) ? 0 : modifiedNitrogenValue,
          nutrientValues: calculatedNutrients,
        ),
      ),
    );
  }

  bool isDataComplete() {
    bool isComplete = true;
    nutrientValues.forEach((key, value) {
      if (value <= 0) {
        isComplete = false;
      }
    });
    if (fertilizerDensity <= 0) {
      isComplete = false;
    }
    return isComplete;
  }
}
