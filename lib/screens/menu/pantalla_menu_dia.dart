import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/menu/seccion_cuerpo_menu.dart';

//Pantalla Menu.
class PantallaMenuDia extends StatelessWidget {
  const PantallaMenuDia({super.key});

  /*
  Funcion que construye la pantalla de menú donde a su scaffold le mandamos
  las clase antes definidas de Appbar, BottomNavigationBar y la SecciónCuerpoMenu.
  */
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SeccionCuerpoMenu(),
    );
  }
}
