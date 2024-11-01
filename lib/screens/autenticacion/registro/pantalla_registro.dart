import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/autenticacion/registro/seccion_cuerpo_registro.dart';
import 'package:food_tech_app/screens/autenticacion/registro/seccion_encabezado_registro.dart';
import 'package:food_tech_app/screens/autenticacion/registro/seccion_titulos_registro.dart';

class PantallaRegistro extends StatelessWidget {
  const PantallaRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SeccionLogo(),
                SeccionTitulosRegistro(),
                SeccionCuerpoRegistro(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
