import '../OperacionEstadistica.dart';

class Varianza implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {
    double media = datos.reduce((a, b) => a + b) / datos.length;
    return datos.map((x) => (x - media) * (x - media)).reduce((a, b) => a + b) / datos.length;
  }
}
