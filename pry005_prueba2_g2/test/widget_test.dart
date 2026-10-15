import 'package:flutter_test/flutter_test.dart';
import 'package:pry005_prueba2_g2/main.dart';

void main() {
  testWidgets('Carga el menú principal y muestra las opciones de ejercicios', (WidgetTester tester) async {
    await tester.pumpWidget(const Prueba2App());

    expect(find.text('Prueba 2 - Menú de Ejercicios'), findsOneWidget);
    expect(find.text('7. Divisores de un número'), findsOneWidget);
    expect(find.text('8. Inversión de un número'), findsOneWidget);
    expect(find.text('9. Suma de dígitos'), findsOneWidget);
  });
}
