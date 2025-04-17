import 'OperacionEstadistica.dart';

class Varianza implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {

    double suma = 0;
    double media = 0;
    double varianza = 0;

    for (var dato in datos) {
      suma += dato;
    }
    media = suma / datos.length;


    for (var dato in datos) {
      varianza += (dato - media) * (dato - media);
    }
    varianza = varianza / (datos.length - 1);

    return varianza;
  }
}
