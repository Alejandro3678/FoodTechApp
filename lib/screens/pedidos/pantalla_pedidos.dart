import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/pedidos/seccion_cuerpo_pedido.dart';
import 'package:food_tech_app/widgets/custom_appbar_two.dart';

//Pantalla Pedidos.
class PantallaPedidos extends StatelessWidget {
  const PantallaPedidos({super.key});

  /*
  Funcion que construye la pantalla de menú donde a su scaffold le mandamos
  las clase antes definidas de Appbar, BottomNavigationBar y la SecciónCuerpoMenu.
  */
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbarTwo(),
      body: SeccionCuerpoPedido(),
    );
  }
}