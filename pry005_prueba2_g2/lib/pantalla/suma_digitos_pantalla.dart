import 'package:flutter/material.dart';
import '../logica/suma_digitos_logica.dart';

class SumaDigitosPantalla extends StatefulWidget {
  const SumaDigitosPantalla({super.key});

  @override
  State<SumaDigitosPantalla> createState() => _SumaDigitosPantallaState();
}

class _SumaDigitosPantallaState extends State<SumaDigitosPantalla> {
  final logica = SumaDigitosLogica();
  final numeroController = TextEditingController();

  String numeroIngresado = '-';
  String descomposicion = '-';
  String sumaResultado = '-';
  String clasificacionParidad = '-';

  void calcular() {
    int? num = int.tryParse(numeroController.text);
    if (num == null || num <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ingresa un número entero positivo mayor a 0.'),
        ),
      );
      return;
    }

    final suma = logica.sumarDigitos(num);
    final digitos = logica.obtenerDigitos(num);
    final paridad = logica.clasificarParidad(suma);

    setState(() {
      numeroIngresado = '$num';
      descomposicion = digitos.join(' + ');
      sumaResultado = '$suma';
      clasificacionParidad = paridad;
    });
  }

  void limpiar() {
    setState(() {
      numeroController.clear();
      numeroIngresado = '-';
      descomposicion = '-';
      sumaResultado = '-';
      clasificacionParidad = '-';
    });
  }

  @override
  void dispose() {
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 9 - Suma de Dígitos'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Suma de Dígitos y Paridad',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ingresa un número entero positivo para calcular la suma de sus dígitos y determinar si dicha suma es PAR o IMPAR.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número entero positivo',
                hintText: 'Ej. 456',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calculate),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: calcular,
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text('Calcular Suma'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                const SizedBox(width: 15),
                OutlinedButton.icon(
                  onPressed: limpiar,
                  icon: const Icon(Icons.clear),
                  label: const Text('Limpiar'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resultados:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Divider(height: 20),
                    Text(
                      'Número ingresado: $numeroIngresado',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Descomposición: $descomposicion',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Suma de los dígitos: $sumaResultado',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Clasificación: $clasificacionParidad',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
