abstract class Productos {
  late String titulo;
  late String descripcion;
  late double porcentaje;

  Productos(this.titulo, this.descripcion, this.porcentaje);
}

class Urea extends Productos {
  Urea()
      : super('UREA', 'Nitrogeno Ureico (N)', 0.46);
}

class CloruroPotasio extends Productos {
  CloruroPotasio()
      : super('CLORURO DE POTASIO G', 'Potasio soluble en agua (K2O)', 0.6);
}

class CalViva extends Productos {
  CalViva()
      : super('CAL VIVA', 'Calsio soluble HCL (CaO)', 0.6847);
}

class SiliMagnesio extends Productos {
  SiliMagnesio()
      : super('SILI-MAGNESIO RIVERA', 'Oxido de Magnesio (MGO)', 0.32);
}

class SuperFosfatoTriple extends Productos {
  SuperFosfatoTriple()
      : super('SUPERFOSFATO TRIPLE', 'Fosforo (P2O5)', 0.46);
}

class VolcanS90 extends Productos {
  VolcanS90()
      : super('VOLCAN S-90', 'Azufre (S)', 0.9);
}


