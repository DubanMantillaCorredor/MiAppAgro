abstract class Calculator {
  late double profundidadCultivo;
  late Map<String, double> nutrientValues;

  Calculator({required this.profundidadCultivo, required this.nutrientValues});
}

class PapaCalculadora extends Calculator {
  PapaCalculadora()
      : super(profundidadCultivo: 0.25, nutrientValues: {
          'Nitrogeno': 350,
          'Fosforo': 150,
          'Potasio': 350,
          'Calcio': 150,
          'Azufre': 70,
          'Magnesio': 70,
        });
}

class CebollaCalculadora extends Calculator {
  CebollaCalculadora()
      : super(profundidadCultivo: 0.10, nutrientValues: {
          'Nitrogeno': 200,
          'Fosforo': 150,
          'Potasio': 200,
          'Calcio': 100,
          'Azufre': 30,
          'Magnesio': 70,
        });
}
