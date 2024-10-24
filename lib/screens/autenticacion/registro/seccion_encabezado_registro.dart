import 'package:flutter/material.dart';

/*
Clase donde diseñamos la interfaz de sección encabezado de la pantalla
REGISTRO
*/
class SeccionLogo extends StatelessWidget {
  final String rutaImagen = "assets/img/logo_rico_app.png";
  const SeccionLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(rutaImagen),
    ));
  }
}