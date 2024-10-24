import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

//Clase de Seccion Encabezado de cada pantalla
//donde le mandamos los argumentos de titulo y logo
class SeccionEncabezado extends StatelessWidget {
  final String tituloPantalla;
  final String rutaLogo;

  const SeccionEncabezado({
    required this.tituloPantalla,
    required this.rutaLogo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            tituloPantalla,
            style: const TextStyle(
              color: AppColors.naranja,
              fontFamily: "Allerta",
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          Image.asset(
            rutaLogo,
            width: 70.0,
            height: 70.0,
          ),
        ],
      ),
    );
  }
}
