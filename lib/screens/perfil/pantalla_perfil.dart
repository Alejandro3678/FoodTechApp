import "package:flutter/material.dart";
import "package:food_tech_app/screens/perfil/seccion_cuerpo_perfil.dart";
import "package:food_tech_app/widgets/custom_appbar_two.dart";

class PantallaPerfil extends StatelessWidget {
  const PantallaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarTwo(),
      body: SeccionCuerpoPerfil(),
    );
  }
}
