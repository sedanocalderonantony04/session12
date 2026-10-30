import 'package:flutter/material.dart';

class ProductosPage extends StatelessWidget {
  ProductosPage({super.key});
  final List<Map<String, dynamic>> productos = [
    {'nombre': 'Teclado mecánico', 'precio': 150.00, 'icono': Icons.keyboard},
    {'nombre': 'Mouse inalámbrico', 'precio': 75.00, 'icono': Icons.mouse},
    {'nombre': 'Monitor 24 pulgadas', 'precio': 650.00, 'icono': Icons.monitor},
    {
      'nombre': 'Audífonos Bluetooth',
      'precio': 120.00,
      'icono': Icons.headphones,
    },
    {'nombre': 'Memoria USB 64GB', 'precio': 35.00, 'icono': Icons.usb},
    {'nombre': 'Laptop Core i5', 'precio': 2500.00, 'icono': Icons.laptop},
    {'nombre': 'Webcam HD', 'precio': 95.00, 'icono': Icons.camera_alt},
    {'nombre': 'Parlante Bluetooth', 'precio': 110.00, 'icono': Icons.speaker},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogo de productos'),
        centerTitle: true,
      ), // AppBar
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final producto = productos[index];
          return Card(
            elevation: 2,
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 28,
                child: Icon(producto['icono'] as IconData, size: 28),
              ),
              title: Text(
                producto['nombre'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Precio: ${(producto['precio'] as double).toStringAsFixed(2)}',
              ),
              trailing: const Icon(Icons.shopping_cart_outlined),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Seleccionastes el Producto: ${producto['nombre']}',
                    ),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 5);
        },
      ),
    );
  }
}
