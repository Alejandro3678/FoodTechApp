import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_provider.dart';
import 'package:food_tech_app/screens/pedidos/pantalla_pedidos.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:provider/provider.dart'; // Importa Provider

class BarraNavegacionSuperior extends StatelessWidget
    implements PreferredSizeWidget {
  final String iconoApp = "assets/img/icono_rico_app.png";
  final String nombreApp = "RicoApp";
  
  const BarraNavegacionSuperior({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.naranja,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            width: 50.0,
            height: 50.0,
            iconoApp,
            fit: BoxFit.cover,
          ),
          Text(
            nombreApp,
            style: const TextStyle(
              color: AppColors.blanco,
              fontSize: 28.0,
              fontFamily: "MoreSugar",
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    // Dirige a pantalla de pedidos
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PantallaPedidos()),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart_rounded),
                  color: AppColors.primaryIconColor,
                  iconSize: 30.0,
                ),
                if (cartProvider.itemCount > 0) // Muestra el contador solo si hay productos
                  Positioned(
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      constraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blanco,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${cartProvider.itemCount}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.negro,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
