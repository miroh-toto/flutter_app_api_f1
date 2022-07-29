import 'package:flutter/material.dart';
import 'package:projet_final/screens/home.dart';
import 'package:projet_final/screens/lists/listCircuits.dart';
import 'package:projet_final/screens/lists/listConstructeurs.dart';
import 'package:projet_final/screens/lists/listPilotes.dart';
import 'package:projet_final/screens/details/detailsPilotes.dart';
import 'package:projet_final/screens/details/detailsConstructeurs.dart';
import 'package:projet_final/screens/details/detailsCircuits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Database App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' : (context) => const MyHomePage(),
        '/affichagePilotes': (context) => const AffichagePilotes(),
        '/affichageConstructeurs': (context) => const AffichageConstructeurs(),
        '/affichageCircuits': (context) => const AffichageCircuits(),
        '/detailsPilotes': (context) => const DetailDuPilote(),
        '/detailsConstructeurs': (context) => const DetailsConstructeurs(),
        '/detailsCircuits': (context) => const DetailsCircuits(),
      },
    );
  }
}