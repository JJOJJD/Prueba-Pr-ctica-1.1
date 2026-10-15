import 'package:flutter/material.dart';
import 'pantalla/menu_pantalla.dart';
import 'pantalla/divisores_pantalla.dart';
import 'pantalla/inversion_pantalla.dart';
import 'pantalla/suma_digitos_pantalla.dart';

void main() => runApp(const Prueba2App());

class Prueba2App extends StatelessWidget {
  const Prueba2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba 2 - David Rodríguez (G2)',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const MenuPantalla(),
        '/divisores': (_) => const DivisoresPantalla(),
        '/inversion': (_) => const InversionPantalla(),
        '/suma_digitos': (_) => const SumaDigitosPantalla(),
      },
    );
  }
}
