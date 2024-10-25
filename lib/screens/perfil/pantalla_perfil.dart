import "package:flutter/material.dart";
import "package:food_tech_app/screens/perfil/seccion_cuerpo_perfil.dart";
import "package:food_tech_app/widgets/custom_appbar_two.dart";

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarTwo(),
      body: SeccionCuerpoPerfil(
        nombreUsuario: "Jonathan Josué",
        apellidosUsuario: "Dominguez Gómez",
        correoUsuario: "jonathanjosuedominguezgomez@gmail.com",
        telefonoUsuario: "7513-2739",
        dateBirthday: "07/10/2000",
      ),
    );
  }
}
