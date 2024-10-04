import 'dart:async';
import 'package:flutter/material.dart';

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
    //Navega a la proxima pantalla despues de 3 segundos
    Timer(const Duration(seconds: 3), () {
      /*
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PantallaInicioSesion()),
      );
      */
      Navigator.pushReplacementNamed(context, "/inicioSesion");
    });
  }

  //Construimos el logo centrado en la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(rutaImagen),
        ),
      ),
    );
  }
}
