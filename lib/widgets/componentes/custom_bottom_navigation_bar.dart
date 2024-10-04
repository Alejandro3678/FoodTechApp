import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/categoria/pantalla_cantidad_producto.dart';
import 'package:food_tech_app/screens/categoria/pantalla_categoria.dart';
import 'package:food_tech_app/screens/categoria/pantalla_producto.dart';
import 'package:food_tech_app/screens/menu/pantalla_menu_dia.dart';
import 'package:food_tech_app/screens/perfil/pantalla_perfil.dart';
import 'package:food_tech_app/screens/principal/pantalla_principal.dart';
import 'package:food_tech_app/screens/reservacion/pantalla_disponibilidad.dart';
import 'package:food_tech_app/utils/colors.dart';

class BarraNavegacionInferior extends StatefulWidget {
  const BarraNavegacionInferior({super.key});

  @override
  State<BarraNavegacionInferior> createState() =>
      _BarraNavegacionInferiorState();
}

class _BarraNavegacionInferiorState extends State<BarraNavegacionInferior> {
  //Variable que me indica el item que estara seleccionado
  int itemSeleccionado = 0;

  //Lista que contiene las pantallas a las que se podra navegar
  //con los items del Bottom Navigator Bar
  final List<Widget> pantallas = [
    const PantallaPrincipal(),
    const CategoriesPage(),
    const ProductPage(),
    const DetalleProductoCantidadScreen(),
    const PantallaMenuDia(),
    const ReservationScreen(),
    const PantallaPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 20.0, left: 10.0, right: 10.0, top: 10.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.containerBackgroundColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: AppColors.primaryTextColor,
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              itemMenu(Icons.home, "Inicio", 0),
              itemMenu(Icons.assignment, "Categorias", 1),
              itemMenu(Icons.shopping_cart_rounded, "Pedidos", 2),
              itemMenu(Icons.assignment_turned_in, "Ofertas", 3),
              itemMenu(Icons.menu_book_rounded, "Menú del día", 4),
              itemMenu(Icons.assignment_add, "Reservas", 5),
              itemMenu(Icons.person_pin_rounded, "Perfil", 6),
            ],
          ),
        ),
      ),
    );
  }

  //Función que controla la navegación entre los diferentes items
  void navegarItemSeleccionado(int index) {
    setState(() {
      itemSeleccionado = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pantallas[index]),
    );
  }

  //Personalizamos cada item del BottomNavigationBar
  Widget itemMenu(IconData icono, String descripcion, int index) {
    //Cambia color de icono si fue seleccionado
    Color colorIcono = itemSeleccionado == index
        ? AppColors.secondIconColor
        : AppColors.primaryIconColor;

    //Cambia color de texto si fue seleccionado
    Color colorTexto = itemSeleccionado == index
        ? AppColors.secondIconColor
        : AppColors.primaryIconColor;

    return GestureDetector(
      onTap: () => navegarItemSeleccionado(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icono,
              size: 30.0,
              color: colorIcono,
            ),
            const SizedBox(height: 8.0),
            Text(
              descripcion,
              style: TextStyle(
                fontSize: 14.0,
                color: colorTexto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
