import '../OperacionEstadistica.dart';

class Moda implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {
    Map<double, int> frecuencia = {};
    for (var num in datos) {
      frecuencia[num] = (frecuencia[num] ?? 0) + 1;
    }
    int maxFrecuencia = frecuencia.values.reduce((a, b) => a > b ? a : b);
    return frecuencia.entries.firstWhere((e) => e.value == maxFrecuencia).key;
  }
}
