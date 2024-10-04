import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodTech App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodTech App"),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volver a la pantalla anterior
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Implementar la acción para ir al carrito
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
            crossAxisAlignment: CrossAxisAlignment.center, // Centrar horizontalmente
            children: [
              const Text(
                "ENTRADAS",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center, // Centrar el texto
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/imaproducto.png', // Imagen del producto
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                "Nombre producto:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center, // Centrar el texto
              ),
              const SizedBox(height: 5),
              const Text(
                "Tacos al pastor", // Aquí deberías mostrar el nombre real del producto
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center, // Centrar el texto
              ),
              const SizedBox(height: 10),
              const Text(
                "Descripción:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center, // Centrar el texto
              ),
              const SizedBox(height: 5),
              const Text(
                "Tacos al pastor: la receta más conocida en el mundo por su sabrosura. ", // Aquí deberías mostrar la descripción real del producto
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center, // Centrar el texto
              ),
              const SizedBox(height: 20),
              const Text(
                "Precio: \$5.00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange),
                textAlign: TextAlign.center, // Centrar el texto
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implementar la acción para añadir el producto a los pedidos
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Color de fondo del botón
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  "Añadir a pedidos",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/img/compra.png', // Otra imagen
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
