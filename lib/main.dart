import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/autenticacion/pantalla_inicio_sesion.dart';
import 'package:food_tech_app/screens/autenticacion/pantalla_registro.dart';
import 'package:food_tech_app/screens/intro/pantalla_inicio.dart';
import 'package:food_tech_app/screens/menu/pantalla_menu_dia.dart';
import 'package:food_tech_app/screens/perfil/pantalla_perfil.dart';
import 'package:food_tech_app/screens/principal/pantalla.dart';
import 'package:food_tech_app/screens/reservacion/pantalla_disponibilidad.dart';

void main() {
  runApp(RicoApp());
}

class RicoApp extends StatelessWidget {
  RicoApp({super.key});

  final rutaPantallas = {
    "/": (context) => const PantallaInicio(),
    "/inicioSesion": (context) => const PantallaInicioSesion(),
    "/registro": (context) => const PantallaRegistro(),
    "/ofertas": (context) => const PantallaInicio(),
    "/perfil": (context) => const PantallaPerfil(),
    "/menu": (context) => const PantallaMenuDia(),
    "/reserva": (context) => const ReservationScreen(),
    "/principal": (context) => const MainApp(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RicoApp",
      initialRoute: "/",
      routes: rutaPantallas,
    );
  }
}
