import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

class CustomAppbarTwo extends StatelessWidget implements PreferredSizeWidget {
  final String iconoApp = "assets/img/icono_rico_app.png";
  final String nombreApp = "RicoApp";

  const CustomAppbarTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.naranja,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: AppColors.negro,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
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
      centerTitle: false,
    );
  }

  //Con esta funcion le indicamos que altura tendrá el AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
