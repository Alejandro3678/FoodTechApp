import 'package:flutter/material.dart';

/*
Clase donde diseñamos la interfaz de sección encabezado de la pantalla
INICIO SESIÓN
*/
class SeccionEncabezadoLogo extends StatelessWidget {
  final String rutaImagen = "assets/img/logo_rico_app.png";

  const SeccionEncabezadoLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Image.asset(rutaImagen),
        ),
      ),
    );
  }
}
