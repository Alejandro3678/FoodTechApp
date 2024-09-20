import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/componentes/app_bar_base.dart';
import 'package:food_tech_app/widgets/componentes/bottom_navigation_bar_base.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BarraNavegacionSuperior(),
      body: SeccionCuerpo(nombreUsuario: "Jonathan"),
      bottomNavigationBar: BarraNavegacionInferior(),
    );
  }
}

class SeccionCuerpo extends StatelessWidget {
  final String nombreUsuario;

  const SeccionCuerpo({
    required this.nombreUsuario,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "¡Hola, $nombreUsuario!",
                style: const TextStyle(
                  color: AppColors.titleTextColor,
                  fontFamily: "Allerta",
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              //PARA MIENTRAS LUEGO SE HACEN CAMBIOS
              const SizedBox(height: 5),
              titulosEncabezados("Categorías"),
              tarjetasHorizontal(),
              lineaDivisora(),
              titulosEncabezados("Ofertas"),
              tarjetasHorizontal(),
              lineaDivisora(),
              titulosEncabezados("Pedidos"),
              tarjetasHorizontal(),
            ],
          ),
        ),
      ),
    );
  }
}

//Configuramos los titulos del encabezado
Widget titulosEncabezados(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: AppColors.titleTextColor,
          fontFamily: "Allerta",
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
      ),
      const Text(
        "Ver más",
        style: TextStyle(
          color: AppColors.titleTextColor,
          fontFamily: "Allerta",
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    ],
  );
}

//Configuramos las tarjetas para que se puedan mover en horizontal
Widget tarjetasHorizontal() {
  return SizedBox(
    //Establecemos una altura
    height: 250,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      //Cantidad de tarjetas
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 140,
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              //const SizedBox(height: 15.0),
              const Text(
                "Titulo",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: "Actor",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Descripcion",
                style: TextStyle(
                  color: AppColors.primaryTextColor,
                  fontFamily: "Actor",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget lineaDivisora() {
  return const Column(
    children: [
      SizedBox(height: 10),
      Divider(
        color: AppColors.primaryBorderColor,
        thickness: 1,
        height: 10,
      ),
      SizedBox(height: 10),
    ],
  );
}
