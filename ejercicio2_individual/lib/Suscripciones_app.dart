import 'package:flutter/material.dart';
// import '../models/suscripcion.dart';
// import '../services/gestor_suscripciones.dart';
import 'GestorSuscripciones.dart';
import 'Suscripcion.dart';

class SuscripcionesApp extends StatefulWidget {
  const SuscripcionesApp({super.key});

  @override
  State<SuscripcionesApp> createState() => _SuscripcionesAppState();
}

class _SuscripcionesAppState extends State<SuscripcionesApp> {
  final gestor = GestorSuscripciones();
  final _descripcionController = TextEditingController();
  final _precioController = TextEditingController();

  void _agregarSuscripcion() {
    String descripcion = _descripcionController.text;
    double? precio = double.tryParse(_precioController.text);

    if (descripcion.isNotEmpty && precio != null) {
      setState(() {
        gestor.agregarSuscripcion(
          Suscripcion(descripcion: descripcion, precioMensual: precio),
        );
        _descripcionController.clear();
        _precioController.clear();
      });
    }
  }

  void _eliminarSuscripcion(Suscripcion s) {
    setState(() {
      gestor.eliminarSuscripcion(s);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestor de Suscripciones')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: _descripcionController,
            decoration: const InputDecoration(labelText: 'Descripción'),
          ),
          TextField(
            controller: _precioController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Precio mensual'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _agregarSuscripcion,
            child: const Text('Agregar Suscripción'),
          ),
          const SizedBox(height: 20),
          Text(
            'Total mensual: \$${gestor.calcularTotalMensual().toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: gestor.suscripciones.length,
              itemBuilder: (context, index) {
                final s = gestor.suscripciones[index];
                return ListTile(
                  title: Text(s.descripcion),
                  subtitle: Text('\$${s.precioMensual.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _eliminarSuscripcion(s),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
