import 'package:flutter/material.dart';

import 'estudiante_page.dart';
import 'productos_page.dart';
import 'scroll_page.dart';
import 'carga_dinamica_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //objeto que almacene en el menu
    final actividades = [
      {
        'titulo': 'Lista de estudiantes',
        'icono': Icons.people,
        'pagina': const EstudiantesPage(),
      },
      {
        'titulo': 'Catalogos de Productos',
        'icono': Icons.shopping_cart,
        'pagina': ProductosPage(),
      },
      {
        'titulo': 'Control de Scroll',
        'icono': Icons.swap_vert,
        'pagina': const ScrollPage(),
      },
      {
        'titulo': 'Carga Dinamica',
        'icono': Icons.add_circle,
        'pagina': const CargaDinamicaPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Practica flutter'), centerTitle: true),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: actividades.length,
        itemBuilder: (context, index) {
          final actividad = actividades[index];
          return Card(
            child: ListTile(
              leading: Icon(actividad['icono'] as IconData, size: 30),
              title: Text(actividad['titulo'] as String),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => actividad['pagina'] as Widget,
                  ),
                );
              },
            ),
          );
        },
        //itemCount:
      ),
    );
  }
}
