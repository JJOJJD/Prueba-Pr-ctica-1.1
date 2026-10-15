import 'package:flutter/material.dart';

class MenuPantalla extends StatelessWidget {
  const MenuPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    const opciones = [
      {
        'ruta': '/divisores',
        'titulo': '7. Divisores de un número',
        'descripcion': 'Determinar y mostrar todos los divisores y la cantidad total de un número entero positivo.',
        'icono': Icons.pie_chart_outline,
        'color': Colors.indigo,
      },
      {
        'ruta': '/inversion',
        'titulo': '8. Inversión de un número',
        'descripcion': 'Invertir el orden de los dígitos mediante descomposición matemática y verificar si es capicúa.',
        'icono': Icons.swap_horiz,
        'color': Colors.teal,
      },
      {
        'ruta': '/suma_digitos',
        'titulo': '9. Suma de dígitos',
        'descripcion': 'Calcular la suma de los dígitos de un número e indicar si el resultado es PAR o IMPAR.',
        'icono': Icons.calculate_outlined,
        'color': Colors.deepPurple,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba 2 - Menú de Ejercicios'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.indigo.shade50,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'NRC 36873 - Desarrollo Móvil',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Prueba Parcial 2 - Grupo 2',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Estudiante: David Josué Rodríguez Villarroel',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Selecciona un ejercicio para comenzar:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 14),
            for (final opcion in opciones)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    leading: CircleAvatar(
                      backgroundColor: (opcion['color'] as Color).withOpacity(0.15),
                      child: Icon(opcion['icono'] as IconData, color: opcion['color'] as Color),
                    ),
                    title: Text(
                      opcion['titulo'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(opcion['descripcion'] as String),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () => Navigator.pushNamed(context, opcion['ruta'] as String),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
