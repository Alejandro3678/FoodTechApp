import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

/*
Clase donde diseñamos la interfaz de sección titulo y subtitulo de la pantalla
REGISTRO
*/
class SeccionTitulosRegistro extends StatelessWidget {
  final String titulo = "Registrate";
  final String subtitulo = "Por favor llena todos los campos";
  final String textoPregunta = "¿Ya tienes una cuenta?";
  final String textoInicioSesion = "Iniciar Sesión";

  const SeccionTitulosRegistro({
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              textoPregunta,
              style: const TextStyle(
                color: AppColors.negro,
                fontSize: 18.0,
                fontFamily: "Actor",
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/inicioSesion",
                );
              },
              child: Text(
                textoInicioSesion,
                style: const TextStyle(
                  color: AppColors.naranja,
                  fontSize: 18.0,
                  fontFamily: "Actor",
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.naranja,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Text(
          subtitulo,
          style: const TextStyle(
            color: AppColors.grisOscuro,
            fontSize: 16.0,
            fontFamily: "Allerta",
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
