import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/categoria/pantalla_categoria.dart';
import 'package:food_tech_app/screens/menu/pantalla_menu_dia.dart';
import 'package:food_tech_app/screens/ofertas/pantalla_ofertas.dart';
import 'package:food_tech_app/screens/reservacion/pantalla_disponibilidad.dart';
import 'package:food_tech_app/screens/pedidos/pantalla_pedidos.dart';
import 'package:food_tech_app/utils/colors.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final String iconoApp = "assets/img/icono_rico_app.png";
  final String nombreApp = "RicoApp";
  int itemSeleccionado = 0; // Índice del ítem seleccionado

  // Lista de pantallas
  final List<Widget> listaPantallas = const [
    PantallaOfertas(),
    PantallaCategorias(),
    PantallaMenuDia(),
    PantallaDisponibilidad(),
    PantallaPedidos()
  ];

  void onItemTapped(int index) {
    setState(() {
      // Cambia el ítem seleccionado
      itemSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.containerBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              width: 50.0,
              height: 50.0,
              iconoApp,
              fit: BoxFit.cover,
            ),
            Text(
              nombreApp,
              style: const TextStyle(
                color: AppColors.secondTextColor,
                fontSize: 28,
                fontFamily: "MoreSugar",
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
          color: AppColors.primaryIconColor,
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            // Navega a la pantalla de Pedidos cuando se presiona el ícono
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_rounded),
            color: AppColors.primaryIconColor,
            iconSize: 30.0,
          ),
        ],
      ),
      body:
          // Muestra la pantalla seleccionada
      listaPantallas[itemSeleccionado],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.containerBackgroundColor,
        // Cambia la pantalla cuando se presiona un icono
        onTap: onItemTapped,
        currentIndex: itemSeleccionado,
        selectedItemColor: AppColors.secondIconColor,
        unselectedItemColor: AppColors.primaryIconColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: "Ofertas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Categorías",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: "Menú",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_add),
            label: "Reservas",
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
