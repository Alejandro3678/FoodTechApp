import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/ofertas/carrusel_ofertas.dart';
import 'package:food_tech_app/screens/ofertas/tarjeta_ofertas.dart';
import 'package:food_tech_app/utils/colors.dart';

class SeccionCuerpoOfertas extends StatelessWidget {
  final String? nombreUsuario;

  const SeccionCuerpoOfertas({
    this.nombreUsuario,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "¡Hola, $nombreUsuario!",
                style: const TextStyle(
                  color: AppColors.titleTextColor,
                  fontFamily: "Allerta",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 15.0),
              const Text(
                "PROMOCIONES DESTACADAS",
                style: TextStyle(
                  color: AppColors.grisOscuro,
                  fontFamily: "Actor",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              const CarruselOfertas(),
              const SizedBox(height: 15.0),
              const Text(
                "MÁS PROMOCIONES PARA TI",
                style: TextStyle(
                  color: AppColors.grisOscuro,
                  fontFamily: "Actor",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TarjetaOfertas(
                imagenPromocion:
                    "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80",
                nombrePromocion: "BANQUETE DE SOPAS",
                precioPromocion: 12.50,
                descripcionPromocion: "Sopita",
              ),
              const TarjetaOfertas(
                imagenPromocion:
                    "https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80",
                nombrePromocion: "BANQUETE DE SOPAS",
                precioPromocion: 12.50,
                descripcionPromocion: "Sopita",
              ),
              const TarjetaOfertas(
                imagenPromocion:
                    "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80",
                nombrePromocion: "BANQUETE DE SOPAS",
                precioPromocion: 12.50,
                descripcionPromocion: "Sopita",
              ),
            ],
          ),
        ),
      ),
    );
  }
}