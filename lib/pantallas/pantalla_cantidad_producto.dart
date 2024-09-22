import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodTech App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: DetalleProductoCantidadScreen(),
    );
  }
}

class DetalleProductoCantidadScreen extends StatefulWidget {
  @override
  _DetalleProductoCantidadScreenState createState() =>
      _DetalleProductoCantidadScreenState();
}

class _DetalleProductoCantidadScreenState
    extends State<DetalleProductoCantidadScreen> {
  int _cantidad = 1;

  void _incrementCantidad() {
    setState(() {
      _cantidad++;
    });
  }

  void _decrementCantidad() {
    setState(() {
      if (_cantidad > 1) {
        _cantidad--;
      }
    });
  }

  void _cancelar() {
    // Implement cancel action
  }

  void _anadirAlCarrito() {
    // Implement add to cart action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FoodTech App'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Implement navigation to cart
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/img/producto.png',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                child: Column(
                  children: [
                    Text(
                      'Nombre producto: Entrada',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cantidad:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: _decrementCantidad,
                        ),
                        Text(
                          '$_cantidad',
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _incrementCantidad,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: _cancelar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey, // Updated property
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          child: Text(
                            'Cancelar',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _anadirAlCarrito,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange, // Updated property
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          child: Text(
                            'Añadir',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/img/producto1.png',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}