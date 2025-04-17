import 'OperacionEstadistica.dart';

class Media implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {
    double suma = 0;
    for (var dato in datos) {
      suma += dato;
    }
    return suma / datos.length;
  }
}
