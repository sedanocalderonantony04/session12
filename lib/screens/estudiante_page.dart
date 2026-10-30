import 'package:flutter/material.dart';

class EstudiantesPage extends StatelessWidget {
  const EstudiantesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Estudiantes'),
        centerTitle: true,
      ),
      body: const Center(child: Text('Sección de Estudiantes')),
    );
  }
}
