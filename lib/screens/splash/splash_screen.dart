import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/autenticacion/inicio_sesion/pantalla_inicio_sesion.dart';
import 'package:food_tech_app/screens/principal/pantalla.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  //Variable que almacena la ruta de la imagen
  final String rutaImagen = "assets/img/logo_rico_app.png";

  @override
  void initState() {
    super.initState();
    _navigateBasedOnAuth();
  }

  void _navigateBasedOnAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    if (auth.currentUser == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const PantallaInicioSesion(),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainApp(),
        ),
        (route) => false,
      );
    }
  }

  //Construimos el logo centrado en la pantalla
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150.0,
          height: 150.0,
          child: Image.asset(rutaImagen),
        ),
      ),
    );
  }
}
