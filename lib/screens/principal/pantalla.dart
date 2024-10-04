import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/menu/pantalla_menu_dia.dart';
import 'package:food_tech_app/screens/perfil/pantalla_perfil.dart';
import 'package:food_tech_app/screens/ofertas/pantalla_ofertas.dart';
import 'package:food_tech_app/screens/reservacion/pantalla_disponibilidad.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/componentes/custom_appbar.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int itemSeleccionado = 0; // Índice del ítem seleccionado

  // Lista de pantallas
  final List<Widget> listaPantallas = const [
    PantallaOfertas(),
    PantallaPerfil(),
    PantallaMenuDia(),
    ReservationScreen(),
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
      appBar: BarraNavegacionSuperior(),
      body:
          //Muestra la pantalla seleccionada
          listaPantallas[itemSeleccionado],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.containerBackgroundColor,
        //Cambia la pantalla cuando se presiona un icno
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
