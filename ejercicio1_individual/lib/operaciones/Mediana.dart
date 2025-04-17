import '../OperacionEstadistica.dart';

class Mediana implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {
    var ordenados = [...datos]..sort();
    int n = ordenados.length;
    if (n % 2 == 1) {
      return ordenados[n ~/ 2];
    } else {
      return (ordenados[n ~/ 2 - 1] + ordenados[n ~/ 2]) / 2;
    }
  }
}
