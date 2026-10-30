import 'package:flutter/material.dart';

class CargaDinamicaPage extends StatelessWidget {
  const CargaDinamicaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carga Dinámica'), centerTitle: true),
      body: const Center(child: Text('Sección de Carga Dinámica')),
    );
  }
}
