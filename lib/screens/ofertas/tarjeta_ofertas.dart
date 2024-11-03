import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_item.dart';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_provider.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:provider/provider.dart';

class TarjetaOfertas extends StatelessWidget {
  final String imagenOferta;
  final String nombreOferta;
  final String descripcionOferta;
  final String validezOferta;
  final double precioOferta;

  const TarjetaOfertas({
    required this.imagenOferta,
    required this.nombreOferta,
    required this.descripcionOferta,
    required this.validezOferta,
    required this.precioOferta,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Image.network(
            imagenOferta,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          nombreOferta,
          style: const TextStyle(
            color: AppColors.negro,
            fontFamily: "Actor",
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          descripcionOferta,
          style: const TextStyle(
            color: AppColors.grisOscuro,
            fontFamily: "Actor",
            fontSize: 12.0,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Validez:",
                style: const TextStyle(
                  color: AppColors.naranja,
                  fontFamily: "Actor",
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                validezOferta,
                style: const TextStyle(
                  color: AppColors.naranja,
                  fontFamily: "Actor",
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "PRECIO: ",
              style: TextStyle(
                color: AppColors.grisOscuro,
                fontFamily: "Actor",
                fontSize: 12.0,
              ),
            ),
            Text(
              precioOferta.toStringAsFixed(2),
              style: const TextStyle(
                color: AppColors.naranja,
                fontFamily: "Allerta",
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final cartProvider =
                    Provider.of<CartProvider>(context, listen: false);

                // Crea un nuevo CartItem con los detalles del producto
                CartItem newItem = CartItem(
                  imagenComida: imagenOferta,
                  tituloComida: nombreOferta,
                  descripcionComida: descripcionOferta,
                  validezComida: validezOferta,
                  precioComida: precioOferta,
                  cantidad: 1, // Puedes establecer la cantidad inicial aquí
                );

                // Agrega el nuevo item al carrito
                cartProvider.addItem(context, newItem);

                // Muestra un mensaje de confirmación
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
                              nombreOferta.toUpperCase(),
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
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.naranja),
                elevation: WidgetStatePropertyAll(4.0),
              ),
              child: const Text(
                "Añadir al carrito",
                style: TextStyle(
                  color: AppColors.blanco,
                  fontFamily: "Actor",
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 15.0)),
      ],
    );
  }
}
