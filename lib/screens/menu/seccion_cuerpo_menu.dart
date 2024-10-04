import 'package:flutter/material.dart';
import 'package:food_tech_app/widgets/componentes/custom_card.dart';
import 'package:food_tech_app/widgets/componentes/custom_seccion_encabezado.dart';

//Clase donde construimos la seccion del cuerpo de la pantalla menú.
class SeccionCuerpoMenu extends StatelessWidget {
  /*
  Definimos variables donde almacenamos el titulo y logo 
  del encabezado de la pantalla.
  */
  final String titulo = "MENÚ DE COMIDAS";
  final String logo = "assets/img/logo_menu.png";

  const SeccionCuerpoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              /*
              Mandamos los valores de las variables definidas para los 
              parametros requeridos de la clase SeccionEncabezado.
              */
              SeccionEncabezado(
                tituloPantalla: titulo,
                rutaLogo: logo,
              ),
              /*
              Llamamos la clase Tarjetas y le colocamos valores de ejemplo a 
              los parametros requeridos.
              */
              const Tarjetas(
                imagenComida:
                    "https://i0.wp.com/goula.lat/wp-content/uploads/2019/12/hamburguesa-beyond-meat-scaled-e1577396155298.jpg?fit=1600%2C1068&ssl=1",
                tituloComida: "HAMBURGUESA",
                descripcionComida: "Papas, carne de res, ceboola",
                precioComida: 10.50,
              ),
              const Tarjetas(
                imagenComida:
                    "https://pjsv-images.nyc3.digitaloceanspaces.com/common-files/product-126/bebida_coca_cola_lata.jpg",
                tituloComida: "Coca Cola Lata",
                descripcionComida: "Coca-Cola Lata 354mL",
                precioComida: 1.55,
              ),
              const Tarjetas(
                imagenComida:
                    "https://pjsv-images.nyc3.digitaloceanspaces.com/common-files/product-126/bebida_coca_cola_lata.jpg",
                tituloComida: "Coca Cola Lata",
                descripcionComida: "Coca-Cola Lata 354mL",
                precioComida: 1.55,
              ),
              const Tarjetas(
                imagenComida:
                    "https://pjsv-images.nyc3.digitaloceanspaces.com/common-files/product-31/238-item-agua.jpg",
                tituloComida: "Botella de Agua",
                descripcionComida: "Botella de agua 600mL",
                precioComida: 1.50,
              ),
              const Tarjetas(
                imagenComida:
                    "https://pjsv-images.nyc3.digitaloceanspaces.com/common-files/product-26/coca-cola.jpg",
                tituloComida: "Coca Cola 1.25L",
                descripcionComida: "Coca-Cola Botella 1.25 L",
                precioComida: 1.75,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
