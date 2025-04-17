import 'OperacionEstadistica.dart';
import 'Media.dart';
import 'Mediana.dart';
import 'Moda.dart';
import 'Varianza.dart';
import 'DesviacionEstandar.dart';

class OperacionFactory {
  static OperacionEstadistica? obtenerOperacion(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'media':
        return Media();
      case 'mediana':
        return Mediana();
      case 'moda':
        return Moda();
      case 'varianza':
        return Varianza();
      case 'desviacion':
        return DesviacionEstandar();
      default:
        return null;
    }
  }
}
