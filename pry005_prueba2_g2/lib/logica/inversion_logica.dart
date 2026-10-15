class InversionLogica {
  int invertirNumero(int numero) {
    if (numero <= 0) return 0;

    int invertido = 0;
    int temp = numero;

    while (temp > 0) {
      int digito = temp % 10;
      invertido = (invertido * 10) + digito;
      temp ~/= 10;
    }

    return invertido;
  }

  bool esCapicua(int numero) {
    return numero == invertirNumero(numero);
  }
}
