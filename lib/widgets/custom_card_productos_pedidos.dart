import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

class TarjetaProductosPedidos extends StatefulWidget {
  final String imagenComida;
  final String tituloComida;
  final String descripcionComida;
  final double precioComida;
  final int cantidad; // Añadir el parámetro cantidad
  final Function() onDelete; // Callback para eliminar el producto
  final Function(int) onQuantityChanged; // Callback para cambiar la cantidad

  const TarjetaProductosPedidos({
    required this.imagenComida,
    required this.tituloComida,
    required this.descripcionComida,
    required this.precioComida,
    required this.cantidad, // Iniciar con la cantidad
    required this.onDelete, // Inicializar el callback
    required this.onQuantityChanged, // Inicializar el callback
    super.key,
  });

  @override
  State<TarjetaProductosPedidos> createState() =>
      _TarjetaProductosPedidosState();
}

class _TarjetaProductosPedidosState extends State<TarjetaProductosPedidos> {
  late int incrementadorComida;

  @override
  void initState() {
    super.initState();
    incrementadorComida = widget.cantidad; // Inicializa desde el widget
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    widget.imagenComida,
                    width: 100.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.tituloComida,
                        style: const TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Actor",
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        widget.descripcionComida,
                        style: const TextStyle(
                          color: AppColors.grisOscuro,
                          fontSize: 12.0,
                          fontFamily: "Actor",
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "\$${(widget.precioComida * incrementadorComida).toStringAsFixed(2)}",
                        style: const TextStyle(
                          color: AppColors.titleTextColor,
                          fontSize: 18.0,
                          fontFamily: "Allerta",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 50.0),
                Container(
                  height: 35.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: AppColors.naranja,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (incrementadorComida > 1) {
                              incrementadorComida--;
                              widget.onQuantityChanged(incrementadorComida); // Actualiza la cantidad
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: AppColors.blanco,
                        ),
                      ),
                      Text(
                        "$incrementadorComida",
                        style: const TextStyle(
                          color: AppColors.blanco,
                          fontSize: 18.0,
                          fontFamily: "Allerta",
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            incrementadorComida++;
                            widget.onQuantityChanged(incrementadorComida); // Actualiza la cantidad
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.blanco,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 50.0),
                IconButton(
                  onPressed: () {
                    widget.onDelete(); // Llama al callback para eliminar
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.rojo,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
