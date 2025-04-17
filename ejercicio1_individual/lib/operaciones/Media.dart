import '../OperacionEstadistica.dart';

class Media implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {
    return datos.reduce((a, b) => a + b) / datos.length;
  }
}
