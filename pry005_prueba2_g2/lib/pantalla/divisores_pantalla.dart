import 'package:flutter/material.dart';
import '../logica/divisores_logica.dart';

class DivisoresPantalla extends StatefulWidget {
  const DivisoresPantalla({super.key});

  @override
  State<DivisoresPantalla> createState() => _DivisoresPantallaState();
}

class _DivisoresPantallaState extends State<DivisoresPantalla> {
  final logica = DivisoresLogica();
  final numeroController = TextEditingController();

  String numeroIngresado = '-';
  String listaDivisores = '-';
  String cantidadDivisores = '-';
  String clasificacionPrimo = '-';

  void calcular() {
    int? num = int.tryParse(numeroController.text);
    if (num == null || num <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa un número entero positivo mayor a 0.')),
      );
      return;
    }

    final divisores = logica.obtenerDivisores(num);
    final cantidad = logica.contarDivisores(num);
    final esPrimo = logica.esPrimo(num);

    setState(() {
      numeroIngresado = '$num';
      listaDivisores = divisores.join(', ');
      cantidadDivisores = '$cantidad';
      clasificacionPrimo = esPrimo ? 'Primo' : 'Compuesto';
    });
  }

  void limpiar() {
    setState(() {
      numeroController.clear();
      numeroIngresado = '-';
      listaDivisores = '-';
      cantidadDivisores = '-';
      clasificacionPrimo = '-';
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
        title: const Text('Ejercicio 7 - Divisores'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Divisores de un Número',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ingresa un número entero positivo para encontrar todos sus divisores y la cantidad total.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número entero positivo',
                hintText: 'Ej. 12',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: calcular,
                  icon: const Icon(Icons.calculate),
                  label: const Text('Calcular'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
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
                      'Divisores: $listaDivisores',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Cantidad de divisores: $cantidadDivisores',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Clasificación: $clasificacionPrimo',
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
