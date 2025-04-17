import 'dart:math';
import 'OperacionEstadistica.dart';
import 'Varianza.dart';

class DesviacionEstandar implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {
    
    // utilizamos una instancia de la clase varianza
    Varianza varianza = Varianza();

    double valorVarianza = varianza.calcular(datos);

    return sqrt(valorVarianza);
  }
}
