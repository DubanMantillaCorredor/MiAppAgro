import 'package:flutter/material.dart';
import 'package:mi_agro_app/Resources/WidgetStyles.dart';
import '../Controllers/FarmingTypeController.dart';

class FarmingTypePage extends StatefulWidget {
  final FarmingTypeController controller;

  const FarmingTypePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<FarmingTypePage> createState() => _FarmingTypePageState();
}

class _FarmingTypePageState extends State<FarmingTypePage> {
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
              child: const Text('Cerrar'),
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
        appBar: AppBar(title: const Text("Tipos De Cultivos")),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  height: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _showInfoDialog(
                        "Requerimientos Nutricionales Papa",
                        "Nutriente\t           Rango(kg/ha)\n"
                        "Nitrógeno (N)\t         250\n"
                        "Fósforo (P)(P2O5)\t     150\n"
                        "Potasio (K)\t           250\n"
                        "Calcio (Ca)/(CaO)\t     100\n"
                        "Magnesio (Mg)\t         60\n"
                        "Azufre (S)\t            60\n"
                        "PROFUNDIDAD DE CULTIVO    0.25 m.",
                      );
                    },
                    style: WidgetStyles.ButtonTypeFarming,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/Resources/Images/Cultivo Papa.png',
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Cultivo de Papa",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                  height: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _showInfoDialog(
                        "Requerimientos Nutricionales Cebolla Cabezona",
                        "Nutriente\t           Rango(kg/ha)\n"
                        "Nitrógeno (N)\t        	120\n"
                        "Fósforo (P)(P2O5)\t	    90\n"
                        "Potasio (K)\t          	150\n"
                        "Calcio (Ca)(CaO)\t	      100\n"
                        "Magnesio (Mg)\t	        30\n"
                        "Azufre (S)\t           	50\n",
                      );
                    },
                    style: WidgetStyles.ButtonTypeFarming,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/Resources/Images/Cultivo Cebolla.png',
                          height: 70,
                          width: 70,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Cultivo de Cebolla",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

