abstract class Calculator {
  late double profundidadCultivo;
  late Map<String, double> nutrientValues;

  Calculator({required this.profundidadCultivo, required this.nutrientValues});
}

class PapaCalculadora extends Calculator {
  PapaCalculadora()
      : super(profundidadCultivo: 0.25, nutrientValues: {
          'Nitrogeno': 250,
          'Fosforo': 150,
          'Potasio': 250,
          'Calcio': 100,
          'Azufre': 60,
          'Magnesio': 60,
        });
}

class CebollaCalculadora extends Calculator {
  CebollaCalculadora()
      : super(profundidadCultivo: 0.10, nutrientValues: {
          'Nitrogeno': 120,
          'Fosforo': 90,
          'Potasio': 150,
          'Calcio': 100,
          'Azufre': 50,
          'Magnesio': 30,
        });
}
