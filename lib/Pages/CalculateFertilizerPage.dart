import 'package:flutter/material.dart';
import 'package:mi_agro_app/Models/Calculador/Calculator.dart';
import 'package:mi_agro_app/Pages/PartialPage/AppBarPartialPage.dart';
import 'package:mi_agro_app/Resources/LabelConfiguration.dart';
import '../Controllers/CalculateFertilizerController.dart';
import '../Models/Calculador/CebollaCalculadora.dart';
import '../Models/Calculador/PapaCalculadora.dart';
// import '../Resources/LabelConfiguration.dart';
// import '../Resources/WidgetStyles.dart';
// import 'PartialPage/AppBarPartialPage.dart';
// import 'ViewConfiguration.dart';

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
    'Nitrogeno': 0.0,
    'Fosforo': 0.0,
    'Potasio': 0.0,
    'Calcio': 0.0,
    'Azufre': 0.0,
    'Magnesion': 0.0,
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
                  labelText: 'Densidad del fertilizante (kg/L)',
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
                value: selectedCalculator
                    ?.produndidadCultivo, // Valor del DropdownButton
                onChanged: (value) {
                  setState(() {
                    selectedCalculator = value == null
                        ? null
                        : calculators.firstWhere((calculator) =>
                            calculator['value'] == value)['calculator'];
                    selectedCropText = selectedCalculator == null
                        ? 'Seleccionar cultivo'
                        : selectedCalculator
                            .toString(); // Actualizar el texto del cultivo seleccionado
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
                onPressed: isDataComplete()
                    ? () {
                        double nitrogenValue = calculateNitrogen(
                          nutrientValues['Nitrogeno'] ?? 0.0,
                          fertilizerDensity,
                          selectedCalculator!.produndidadCultivo,
                        );
                        print('Valor del nitrógeno calculado: $nitrogenValue');

                        final String cropInfo =
                            '$selectedCropText, Profundidad del cultivo: ${selectedCalculator!.produndidadCultivo}';
                        print(cropInfo);

                        nutrientValues.forEach((key, value) {
                          print('$key: $value');
                        });
                        print('Densidad: $fertilizerDensity');
                      }
                    : null,
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
    double baseNitrogenValue = selectedCalculator?.nitrogeno ?? 0.0;
    double result = baseNitrogenValue -
        (userNitrogenInput * userDensityInput * selectedCropDepth * 1000);
    return result;
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
