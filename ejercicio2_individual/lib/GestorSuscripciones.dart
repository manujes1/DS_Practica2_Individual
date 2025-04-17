// import '../models/suscripcion.dart';
import 'Suscripcion.dart';

class GestorSuscripciones {
  final List<Suscripcion> _suscripciones = [];

  List<Suscripcion> get suscripciones => _suscripciones;

  void agregarSuscripcion(Suscripcion s) {
    _suscripciones.add(s);
  }

  void eliminarSuscripcion(Suscripcion s) {
    _suscripciones.remove(s);
  }

  double calcularTotalMensual() {
    return _suscripciones.fold(0.0, (sum, s) => sum + s.precioMensual);
  }
}
