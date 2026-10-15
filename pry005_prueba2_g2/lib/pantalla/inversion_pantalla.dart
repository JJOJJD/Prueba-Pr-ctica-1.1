import 'package:flutter/material.dart';
import '../logica/inversion_logica.dart';

class InversionPantalla extends StatefulWidget {
  const InversionPantalla({super.key});

  @override
  State<InversionPantalla> createState() => _InversionPantallaState();
}

class _InversionPantallaState extends State<InversionPantalla> {
  final logica = InversionLogica();
  final numeroController = TextEditingController();

  String numeroOriginal = '-';
  String numeroInvertido = '-';
  String resultadoCapicua = '-';

  void calcular() {
    int? num = int.tryParse(numeroController.text);
    if (num == null || num <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa un número entero positivo mayor a 0.')),
      );
      return;
    }

    final invertido = logica.invertirNumero(num);
    final esCapicua = logica.esCapicua(num);

    setState(() {
      numeroOriginal = '$num';
      numeroInvertido = '$invertido';
      resultadoCapicua = esCapicua ? 'Sí es capicúa' : 'No es capicúa';
    });
  }

  void limpiar() {
    setState(() {
      numeroController.clear();
      numeroOriginal = '-';
      numeroInvertido = '-';
      resultadoCapicua = '-';
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
        title: const Text('Ejercicio 8 - Inversión'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Inversión de un Número',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ingresa un número entero positivo para invertir el orden de sus dígitos mediante descomposición matemática.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número a invertir',
                hintText: 'Ej. 12345',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.swap_horiz),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: calcular,
                  icon: const Icon(Icons.replay),
                  label: const Text('Invertir'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
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
                      'Número original: $numeroOriginal',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Número invertido: $numeroInvertido',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '¿Es capicúa?: $resultadoCapicua',
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
