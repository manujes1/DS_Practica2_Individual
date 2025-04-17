import 'package:ejercicio1_individual/OperacionFactory.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: EstadisticaApp()));
}

class EstadisticaApp extends StatefulWidget {
  @override
  _EstadisticaAppState createState() => _EstadisticaAppState();
}

class _EstadisticaAppState extends State<EstadisticaApp> {
  final _controller = TextEditingController();
  String _operacionSeleccionada = 'media';
  String _resultado = '';

  void _calcular() {
    List<double> datos = _controller.text
        .split(',')
        .map((e) => double.tryParse(e.trim()))
        .where((e) => e != null)
        .map((e) => e!)
        .toList();

    var operacion = OperacionFactory.obtenerOperacion(_operacionSeleccionada);
    if (operacion != null && datos.isNotEmpty) {
      double resultado = operacion.calcular(datos);
      setState(() {
        _resultado = resultado.toStringAsFixed(2);
      });
    } else {
      setState(() {
        _resultado = 'Datos inválidos o operación no válida';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora Estadística')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Ingrese números separados por coma'),
          ),
          DropdownButton<String>(
            value: _operacionSeleccionada,
            items: ['media', 'moda', 'mediana', 'varianza', 'desviacion']
                .map((op) => DropdownMenuItem(value: op, child: Text(op)))
                .toList(),
            onChanged: (val) {
              setState(() {
                _operacionSeleccionada = val!;
              });
            },
          ),
          ElevatedButton(onPressed: _calcular, child: Text('Calcular')),
          SizedBox(height: 20),
          Text('Resultado: $_resultado', style: TextStyle(fontSize: 20)),
        ]),
      ),
    );
  }
}
