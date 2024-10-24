import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/pedidos/seccion_cuerpo_pedido.dart';
import 'package:food_tech_app/utils/colors.dart';

//Pantalla Pedidos.
class PantallaPedidos extends StatelessWidget {
  const PantallaPedidos({super.key});

  /*
  Funcion que construye la pantalla de menú donde a su scaffold le mandamos
  las clase antes definidas de Appbar, BottomNavigationBar y la SecciónCuerpoMenu.
  */
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
      body: const SeccionCuerpoPedido(),
    );
  }
}