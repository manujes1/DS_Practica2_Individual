import 'OperacionEstadistica.dart';

class Mediana implements OperacionEstadistica {
  @override
  double calcular(List<double> datos) {
    if (datos.isEmpty) {
      throw ArgumentError('La lista de datos no puede estar vacía.');
    }

    var datosOrdenados = List.of(datos)..sort();
    int cantidad = datosOrdenados.length;
    int mitad = cantidad ~/ 2;

    if (cantidad.isOdd) {
      return datosOrdenados[mitad];
    } else {
      return (datosOrdenados[mitad - 1] + datosOrdenados[mitad]) / 2;
    }
  }
}
