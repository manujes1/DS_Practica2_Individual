import 'dart:math';
import '../OperacionEstadistica.dart';

class DesviacionEstandar implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {
    double media = datos.reduce((a, b) => a + b) / datos.length;
    double varianza = datos.map((x) => (x - media) * (x - media)).reduce((a, b) => a + b) / datos.length;
    return sqrt(varianza);
  }
}
