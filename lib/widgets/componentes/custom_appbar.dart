import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

class BarraNavegacionSuperior extends StatelessWidget
    implements PreferredSizeWidget {
  final String nombreApp = "RicoApp";
  const BarraNavegacionSuperior({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.containerBackgroundColor,
      title: Text(
        nombreApp,
        style: const TextStyle(
          color: AppColors.secondTextColor,
          fontSize: 28,
          fontFamily: "MoreSugar",
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu_rounded),
        color: AppColors.primaryIconColor,
        iconSize: 30.0,
      ),
      actions: [
        IconButton(
          onPressed: () {},
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
