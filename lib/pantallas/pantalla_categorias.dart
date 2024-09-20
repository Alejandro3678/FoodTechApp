import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/componentes/app_bar_base.dart';
import 'package:food_tech_app/widgets/componentes/bottom_navigation_bar_base.dart';

class PantallaCategorias extends StatelessWidget {
  const PantallaCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BarraNavegacionSuperior(),
      body: Center(
        child: Column(children: <Widget>[SeccionTitulos(), SeccionCatalogo()]),
      ),
      bottomNavigationBar: BarraNavegacionInferior(),
    );
  }
}

class SeccionTitulos extends StatefulWidget {
  const SeccionTitulos({super.key});

  @override
  State<SeccionTitulos> createState() => _SeccionTitulosState();
}

class _SeccionTitulosState extends State<SeccionTitulos> {
  String titulo = "Categorias";
  String subtitulo = "Selecciona las categorias que deseas ver";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            titulo,
            style: const TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 38,
              fontFamily: "Allerta",
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
          Text(subtitulo)
        ],
      ),
    );
  }
}

class SeccionCatalogo extends StatefulWidget {
  const SeccionCatalogo({super.key});

  @override
  State<SeccionCatalogo> createState() => _SeccionCatalogoState();
}

class _SeccionCatalogoState extends State<SeccionCatalogo> {
  final List<Column> items = [
    Column(
      children: [
        Image(
          image: AssetImage('assets/img/logo_rico_app.png'),
          fit: BoxFit.contain,
          height: 250,
          width: 250,
        ),
        Text("Entradas")
      ],
    ),
    Column(
      children: [
        Image(
          image: AssetImage('assets/img/logo_rico_app.png'),
          fit: BoxFit.contain,
          height: 250,
          width: 250,
        ),
        Text("Comidas")
      ],
    ),
    Column(
      children: [
        Image(
          image: AssetImage('assets/img/logo_rico_app.png'),
          fit: BoxFit.contain,
          height: 250,
          width: 250,
        ),
        Text("Postres")
      ],
    ),
    Column(
      children: [
        Image(
          image: AssetImage('assets/img/logo_rico_app.png'),
          fit: BoxFit.contain,
          height: 250,
          width: 250,
        ),
        Text("Bebidas")
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 600, // constrain height
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(items.length, (index) {
              return items[index];
            }),
          ),
        )
      ],
    );
  }
}
