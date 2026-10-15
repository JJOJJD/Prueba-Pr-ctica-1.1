class DivisoresLogica {
  List<int> obtenerDivisores(int numero) {
    if (numero <= 0) return [];

    List<int> divisores = [];
    for (int i = 1; i <= numero; i++) {
      if (numero % i == 0) {
        divisores.add(i);
      }
    }
    return divisores;
  }

  int contarDivisores(int numero) {
    return obtenerDivisores(numero).length;
  }

  bool esPrimo(int numero) {
    return contarDivisores(numero) == 2;
  }
}
