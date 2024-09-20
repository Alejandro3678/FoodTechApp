import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_tech_app/pantallas/pantala_inicio_sesion.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  //Variable que almacena la ruta de la imagen
  final String rutaImagen = "assets/img/logo_rico_app.png";

  @override
  void initState() {
    super.initState();
    //Navega a la proxima pantalla despues de 5 segundos
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PantallaInicioSesion()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return contenedorInicio(rutaImagen);
  }
}

//Funcion que retorna una imagen centrada en la pantalla
Widget contenedorInicio(String rutaImagen) {
  return Center(
    child: SizedBox(
      width: 150,
      height: 150,
      child: Image.asset(rutaImagen),
    ),
  );
}
