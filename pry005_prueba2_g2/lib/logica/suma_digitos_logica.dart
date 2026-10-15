class SumaDigitosLogica {
  int sumarDigitos(int numero) {
    if (numero <= 0) return 0;

    int suma = 0;
    int temp = numero;

    while (temp > 0) {
      suma += temp % 10;
      temp ~/= 10;
    }

    return suma;
  }

  bool esPar(int suma) {
    return suma % 2 == 0;
  }

  String clasificarParidad(int suma) {
    return esPar(suma) ? 'PAR' : 'IMPAR';
  }

  List<int> obtenerDigitos(int numero) {
    if (numero <= 0) return [];
    List<int> digitos = [];
    int temp = numero;
    while (temp > 0) {
      digitos.add(temp % 10);
      temp ~/= 10;
    }
    return digitos.reversed.toList();
  }
}
