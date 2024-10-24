import "package:flutter/material.dart";
import "package:food_tech_app/screens/perfil/seccion_cuerpo_perfil.dart";
import "package:food_tech_app/utils/colors.dart";

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.naranja,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.negro,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SeccionCuerpoPerfil(
        nombresUsuario: "Jonathan Josué",
        apellidosUsuario: "Dominguez Gómez",
        correoUsuario: "jonathanjosuedominguezgomez@gmail.com",
        telefonoUsuario: "7513-2739",
      ),
    );
  }
}
