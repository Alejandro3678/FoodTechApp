import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/categoria/pantalla_categoria.dart';
import 'package:food_tech_app/screens/menu/pantalla_menu_dia.dart';
import 'package:food_tech_app/screens/ofertas/pantalla_ofertas.dart';
import 'package:food_tech_app/screens/reservacion/pantalla_disponibilidad.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_appbar.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final String iconoApp = "assets/img/icono_rico_app.png";
  final String nombreApp = "RicoApp";

  //Indice del ítem seleccionado
  static int itemSeleccionado = 0;

  //Lista de pantallas
  final List<Widget> listaPantallas = const [
    PantallaOfertas(),
    PantallaCategorias(),
    PantallaMenuDia(),
    PantallaDisponibilidad(),
  ];

  void onItemTapped(int index) {
    setState(() {
      //Cambia el ítem seleccionado
      itemSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BarraNavegacionSuperior(),
      body: listaPantallas[itemSeleccionado],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.naranja,
        onTap: onItemTapped,
        currentIndex: itemSeleccionado,
        selectedItemColor: AppColors.blanco,
        unselectedItemColor: AppColors.negro,
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
