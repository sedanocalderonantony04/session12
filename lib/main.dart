import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),

      home: HomePage(),
    );
  }
}
