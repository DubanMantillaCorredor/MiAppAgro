import 'package:flutter/material.dart';
import 'package:mi_agro_app/Controllers/CalculateFertilizerController.dart';

import 'Controllers/FertilizerTypeController.dart';
import 'Controllers/FieldDiaryController.dart';
import 'Controllers/HomeController.dart';
import 'Controllers/InformationController.dart';
import 'Controllers/InitController.dart';
import 'Controllers/LoginController.dart';
import 'Controllers/MyFarming/CultivationDiaryController.dart';
import 'Controllers/MyFarming/MyFarmingController.dart';
import 'Controllers/RegisterController.dart';
import 'Controllers/FarmingTypeController.dart';
import 'Pages/CalculateFertilizerPage.dart';
import 'Pages/FieldDiaryPage.dart';
import 'Pages/HomePage.dart';
import 'Pages/InformationPage.dart';
import 'Pages/InitPage.dart';
import 'Pages/LoginPage.dart';
import 'Pages/MyFarming/CultivationDiaryPage.dart';
import 'Pages/MyFarming/MyFarmingPage.dart';
import 'Pages/RegisterPage.dart';
import 'Pages/FertilizerTypePage.dart';
import 'Pages/FarmingTypePage.dart';
<<<<<<< HEAD

=======
>>>>>>> 1246c07386dcfd282af392e010252478d5244660

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFE2F3F0),
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1),
              )),
        ),
        initialRoute: '/home',
        routes: {
          '/': (context) => InitPage(controller: InitController()),
          '/login': (context) => LoginPage(controller: LoginController()),
          '/register': (context) =>
              RegisterPage(controller: RegisterController()),
          '/home': (context) => HomePage(controller: HomeController()),
          '/myFarming': (context) =>
              MyFarmingPage(controller: MyFarmingController()),
          '/myFarming/cultivationDiary': (context) =>
              CultivationDiaryPage(controller: CultivationDiaryController()),
          '/fieldDiary ': (context) =>
              FieldDiaryPage(controller: FieldDiaryController()),
          '/calculateFertilizer': (context) => CalculateFertilizerPage(
              controller: CalculateFertilizerController()),
          '/information': (context) =>
              InformationPage(controller: InformationController()),
          '/farmingType': (context) => FarmingTypePage(controller: FarmingTypeController()),
          '/fertilizerType': (context) => FertilizerTypePage(controller: FertilizerTypeController())
        });
  }
}
