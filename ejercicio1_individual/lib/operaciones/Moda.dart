import 'OperacionEstadistica.dart';

class Moda implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {
    // Hacemos un map para almacenar la frecuencia de cada número
    // y luego buscamos el número con la frecuencia máxima
    Map<double, int> frecuencia = {};
    for (var num in datos) {
      frecuencia[num] = (frecuencia[num] ?? 0) + 1; // vamos sumando en 1 la frecuencia
    }
    int maxFrecuencia = frecuencia.values.reduce((a, b) => a > b ? a : b);
    return frecuencia.entries.firstWhere((e) => e.value == maxFrecuencia).key;
  }
}
