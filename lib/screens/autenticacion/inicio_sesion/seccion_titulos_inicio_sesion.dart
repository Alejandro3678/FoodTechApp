import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

/*
Clase donde diseñamos la interfaz de sección titulo y subtitulo de la pantalla
INICIO SESIÓN
*/
class SeccionTitulosInicioSesion extends StatelessWidget {
  final String titulo = "Iniciar Sesión";
  final String subtitulo = "Bienvenido/a";

  const SeccionTitulosInicioSesion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: AppColors.negro,
            fontSize: 38.0,
            fontFamily: "Allerta",
            fontWeight: FontWeight.bold,
            letterSpacing: 5.0,
          ),
        ),
        Text(
          subtitulo,
          style: const TextStyle(
            color: AppColors.grisOscuro,
            fontSize: 16.0,
            fontFamily: "Allerta",
            letterSpacing: 5.0,
          ),
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
