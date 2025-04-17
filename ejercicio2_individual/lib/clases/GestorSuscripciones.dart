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
    double total = 0.0;
    for (var suscripcion in _suscripciones) {
      total += suscripcion.precioMensual;
    }
    return total;
  }
}
