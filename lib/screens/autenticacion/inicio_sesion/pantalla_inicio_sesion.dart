import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/autenticacion/inicio_sesion/seccion_cuerpo_inicio_sesion.dart';
import 'package:food_tech_app/screens/autenticacion/inicio_sesion/seccion_encabezado_inicio_sesion.dart';
import 'package:food_tech_app/screens/autenticacion/inicio_sesion/seccion_titulos_inicio_sesion.dart';

class PantallaInicioSesion extends StatelessWidget {
  const PantallaInicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SeccionEncabezadoLogo(),
              SeccionTitulosInicioSesion(),
              SeccionCuerpoInicioSesion(),
            ],
          ),
        ),
      ),
    );
  }
}
