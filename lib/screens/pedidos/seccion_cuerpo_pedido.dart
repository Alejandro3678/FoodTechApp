import 'package:flutter/material.dart';
import 'package:food_tech_app/widgets/custom_card_pedidos.dart';
import 'package:food_tech_app/widgets/custom_seccion_encabezado.dart';

//Clase donde construimos la seccion del cuerpo de la pantalla menú.
class SeccionCuerpoPedido extends StatelessWidget {
  /*
  Definimos variables donde almacenamos el titulo y logo 
  del encabezado de la pantalla.
  */
  final String titulo = "Pedidos realizados";
  final String logo = "assets/img/logo_rico_app.png";

  const SeccionCuerpoPedido({super.key});

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
              const TarjetasPedidos(
                imagenComida:
                    "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80",
                tituloComida: "HAMBURGUESA",
                descripcionComida: "Papas, carne de res, ceboola",
                precioComida: 10.50,
              ),
              const TarjetasPedidos(
                imagenComida:
                    "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80",
                tituloComida: "Coca Cola Lata",
                descripcionComida: "Coca-Cola Lata 354mL",
                precioComida: 1.55,
              ),
              const TarjetasPedidos(
                imagenComida:
                    "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80",
                tituloComida: "Coca Cola Lata",
                descripcionComida: "Coca-Cola Lata 354mL",
                precioComida: 1.55,
              ),
              const TarjetasPedidos(
                imagenComida:
                    "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80",
                tituloComida: "Botella de Agua",
                descripcionComida: "Botella de agua 600mL",
                precioComida: 1.50,
              ),
              const TarjetasPedidos(
                imagenComida:
                    "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80",
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
