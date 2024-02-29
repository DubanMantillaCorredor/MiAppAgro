import 'package:flutter/material.dart';

import 'Controllers/FarmingTypeController.dart';
import 'Controllers/FertilizerTypeController.dart';
import 'Controllers/HomeController.dart';
import 'Controllers/InformationController.dart';
import 'Controllers/InitController.dart';
import 'Controllers/LoginController.dart';
import 'Controllers/MyFarmingController.dart';
import 'Controllers/RegisterController.dart';
import 'Pages/FarmingTypePage.dart';
import 'Pages/FertilizerTypePage.dart';
import 'Pages/HomePage.dart';
import 'Pages/InformationPage.dart';
import 'Pages/InitPage.dart';
import 'Pages/LoginPage.dart';
import 'Pages/MyFarmingPage.dart';
import 'Pages/RegisterPage.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => InitPage(controller: InitController()),
        '/login': (context) => LoginPage(controller: LoginController()),
        '/register': (context) => RegisterPage(controller: RegisterController()),
        '/home': (context) => HomePage(controller: HomeController()),
        '/myFarming': (context) => MyFarmingPage(controller: MyFarmingController()),
        '/fieldDiary ': (context) => MyFarmingPage(controller: MyFarmingController()),
        '/information ': (context) => InformationPage(controller: InformationController()),
        '/farmingType ': (context) => FarmingTypePage(controller: FarmingTypeController()),
        '/farmingType ': (context) => FertilizerTypePage(controller: FertilizerTypeController()),
      }
    );
  }
}

