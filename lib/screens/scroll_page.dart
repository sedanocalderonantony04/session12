import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final ScrollController _controller = ScrollController();

  // identificar la posición actual
  double posicionActual = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        posicionActual = _controller.offset;
      });
    });
  }

  void irAlInicio() {
    if (!_controller.hasClients) return;
    _controller.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // navegar a una posición en específico
  void irAUnaPosicion() {
    if (!_controller.hasClients) return;
    final posicion = _controller.position.maxScrollExtent;
    _controller.jumpTo(posicion > 300 ? 300 : posicion);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Control de scroll'), centerTitle: true),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Column(
              children: [
                const Text(
                  'Posicion actual del scroll',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '${posicionActual.toStringAsFixed(2)} px',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Lista desplazable
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: 40,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text('Elemento ${index + 1}'),
                    subtitle: const Text('Desplazamiento encontrado'),
                  ), // ListTile
                ); // Card
              },
            ), // ListView.builder
          ), // Expanded
        ],
      ), // Column
      // Botones para el control
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.small(
            heroTag: 'Inicio',
            onPressed: irAlInicio,
            child: const Icon(Icons.arrow_upward),
          ), // FloatingActionButton.small
          const SizedBox(height: 10),
          FloatingActionButton.small(
            heroTag: 'Posicion',
            onPressed: irAUnaPosicion,
            child: const Icon(Icons.vertical_align_center),
          ), // FloatingActionButton.small
        ],
      ), // Column
    ); // Scaffold
  }
}
