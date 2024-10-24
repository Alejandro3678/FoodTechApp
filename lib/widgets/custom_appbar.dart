import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/pedidos/pantalla_pedidos.dart';
import 'package:food_tech_app/utils/colors.dart';

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
        //crossAxisAlignment: CrossAxisAlignment.center,
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
        IconButton(
          onPressed: () {
            //Dirige a pantalla de pedidos
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PantallaPedidos()),
            );
          },
          icon: const Icon(Icons.shopping_cart_rounded),
          color: AppColors.primaryIconColor,
          iconSize: 30.0,
        ),
      ],
    );
  }

  //Con esta funcion le indicamos que altura tendrá el AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
