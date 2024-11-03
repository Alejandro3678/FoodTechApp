import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_item.dart';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_provider.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:provider/provider.dart';

/*
Clase que hereda de StatefulWidget porque estará cambiando de estado.
*/
class TarjetaProductosCategorias extends StatefulWidget {
  //Definimos los atributos que utilizaremos.
  final String imagenComida;
  final String tituloComida;
  final String descripcionComida;
  final double precioComida;

  const TarjetaProductosCategorias({
    required this.imagenComida,
    required this.tituloComida,
    required this.descripcionComida,
    required this.precioComida,
    super.key,
  });

  @override
  State<TarjetaProductosCategorias> createState() =>
      _TarjetaProductosCategoriasState();
}

class _TarjetaProductosCategoriasState
    extends State<TarjetaProductosCategorias> {
  /*
  Construimos las tarjetas donde se presentará la imagen, titulo,
  descripción, precio y botón de agregar al carrito.
  */
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    widget.imagenComida,
                    width: 120.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 5.0),
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
                      Text(
                        widget.descripcionComida,
                        style: const TextStyle(
                          color: AppColors.grisOscuro,
                          fontSize: 12.0,
                          fontFamily: "Actor",
                        ),
                      ),
                      Text(
                        "\$ ${widget.precioComida.toStringAsFixed(2)}",
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
            SizedBox(height: 10.0),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.buttonBackgroundColor,
                ),
                elevation: WidgetStatePropertyAll(5.0),
              ),
              onPressed: () {
                final cartItem = CartItem(
                  imagenComida: widget.imagenComida,
                  tituloComida: widget.tituloComida,
                  descripcionComida: widget.descripcionComida,
                  precioComida: widget.precioComida,
                );

                // Agrega el producto al carrito
                Provider.of<CartProvider>(context, listen: false)
                    .addItem(context, cartItem);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/img/icono_rico_app.png",
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "PRODUCTO AGREGADO A TU CARRITO",
                              style: TextStyle(
                                color: AppColors.naranja,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Actor",
                              ),
                            ),
                            Text(
                              widget.tituloComida.toUpperCase(),
                              style: const TextStyle(
                                color: AppColors.grisOscuro,
                                fontSize: 12.0,
                                fontFamily: "Actor",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text(
                "Añadir al carrito",
                style: TextStyle(
                  color: AppColors.secondTextColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Actor",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
