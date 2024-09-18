import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_tech_app/pantallas/pantala_inicio_sesion.dart';
import 'package:food_tech_app/utils/colors.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final String titulo = "RicoApp";

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
    return Center(
      child: contenedorInicio(titulo),
    );
  }
}

//Construyendo contenedor con texto
Widget contenedorInicio(String titulo) {
  return Container(
    width: 150,
    height: 150,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      color: AppColors.containerBackgroundColor,
    ),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Text(
          titulo,
          style: const TextStyle(
            color: AppColors.secondTextColor,
            fontFamily: "Actor",
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
