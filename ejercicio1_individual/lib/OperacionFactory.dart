import 'OperacionEstadistica.dart';
import 'operaciones/Media.dart';
import 'operaciones/Mediana.dart';
import 'operaciones/Moda.dart';
import 'operaciones/Varianza.dart';
import 'operaciones/DesviacionEstandar.dart';

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
