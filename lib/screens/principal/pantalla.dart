import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/auth_services.dart';
import 'package:food_tech_app/screens/autenticacion/inicio_sesion/pantalla_inicio_sesion.dart';
import 'package:food_tech_app/screens/categoria/pantalla_categoria.dart';
import 'package:food_tech_app/screens/menu/pantalla_menu_dia.dart';
import 'package:food_tech_app/screens/ofertas/pantalla_ofertas.dart';
import 'package:food_tech_app/screens/perfil/pantalla_perfil.dart';
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
      //Menu lateral
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            //Encabezado del menú lateral
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.naranja,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/img/icono_rico_app.png",
                    fit: BoxFit.cover,
                    width: 100.0,
                    height: 100.0,
                  ),
                  const Text(
                    "Bienvenido/a",
                    style: TextStyle(
                      color: AppColors.blanco,
                      fontSize: 20.0,
                      fontFamily: "MoreSugar",
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle,
                color: AppColors.naranja,
                size: 30.0,
              ),
              title: const Text(
                "Mi Perfil",
                style: TextStyle(
                  color: AppColors.negro,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Actor",
                ),
              ),
              onTap: () {
                //Dirige a pantalla perfil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PantallaPerfil()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: AppColors.naranja,
                size: 30.0,
              ),
              title: const Text(
                "Cerrar Sesión",
                style: TextStyle(
                  color: AppColors.negro,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Actor",
                ),
              ),
              onTap: () {
                //Dirige a pantalla perfil
                AuthServices().cerrarSesionUsuario();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const PantallaInicioSesion())
                );
              },
            ),
          ],
        ),
      ),
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
