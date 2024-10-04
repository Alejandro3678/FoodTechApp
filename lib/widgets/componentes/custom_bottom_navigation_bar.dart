import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/menu/pantalla_menu_dia.dart';
import 'package:food_tech_app/screens/perfil/pantalla_perfil.dart';
import 'package:food_tech_app/screens/ofertas/pantalla_ofertas.dart';
import 'package:food_tech_app/screens/reservacion/pantalla_disponibilidad.dart';

class BarraNavegacionInferior extends StatefulWidget {
  const BarraNavegacionInferior({super.key});

  @override
  State<BarraNavegacionInferior> createState() =>
      _BarraNavegacionInferiorState();
}

class _BarraNavegacionInferiorState extends State<BarraNavegacionInferior> {
  //Variable que me indica el item de la pantalla que estara seleccionado
  int itemSeleccionado = 0;

  //Creamos una lista
  List<Widget> listaPantallas = [
    const PantallaOfertas(),
    const PantallaMenuDia(),
    const PantallaPerfil(),
    const ReservationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          itemSeleccionado = index;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => listaPantallas[itemSeleccionado]),
        );
      },
      currentIndex: itemSeleccionado,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "PROMOCIONES",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: "CATEGORIAS",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded),
          label: "MENÚ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_add),
          label: "RESERVAS",
        ),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
