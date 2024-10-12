import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_show_dialog.dart';

/*
Clase que hereda de StatefulWidget porque estará cambiando de estado.
*/
class Tarjetas extends StatefulWidget {
  //Definimos los atributos que utilizaremos.
  final String imagenComida;
  final String tituloComida;
  final String descripcionComida;
  final double precioComida;

  const Tarjetas({
    required this.imagenComida,
    required this.tituloComida,
    required this.descripcionComida,
    required this.precioComida,
    super.key,
  });

  @override
  State<Tarjetas> createState() => _TarjetasState();
}

class _TarjetasState extends State<Tarjetas> {
  //Variable que incrementa o decrementa según su manipulación.
  int incrementadorComida = 1;

  //Función que decrementa la cantidad de comida.
  void decrementar(StateSetter actualizarEstadoDialogo) {
    if (incrementadorComida > 1) {
      actualizarEstadoDialogo(() {
        incrementadorComida--;
      });
    }
  }

  //Función que incrementa la cantidad de comida.
  void incrementar(StateSetter actualizarEstadoDialogo) {
    actualizarEstadoDialogo(() {
      incrementadorComida++;
    });
  }

  /*
  Construimos las tarjetas donde se presentará la imagen, titulo,
  descripción, precio y botón de ver comida.
  */
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.network(
                widget.imagenComida,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.tituloComida,
                    style: const TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Actor",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      CustomShowDialog(
                        imagenComida: widget.imagenComida,
                        nombreComida: widget.tituloComida,
                        descripcionComida: widget.descripcionComida,
                        precioComida: widget.precioComida,
                      ).dialogBuilder(context);
                    },
                    child: const Text(
                      "Leer más >>",
                      style: TextStyle(
                        color: AppColors.titleTextColor,
                        fontSize: 12.0,
                        fontFamily: "Actor",
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryBorderColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${widget.precioComida}",
                        style: const TextStyle(
                          color: AppColors.titleTextColor,
                          fontSize: 18.0,
                          fontFamily: "Allerta",
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.buttonBackgroundColor,
                            ),
                            elevation: WidgetStatePropertyAll(5.0),
                          ),
                          onPressed: () {
                            CustomShowDialog(
                              imagenComida: widget.imagenComida,
                              nombreComida: widget.tituloComida,
                              descripcionComida: widget.descripcionComida,
                              precioComida: widget.precioComida,
                            ).dialogBuilder(context);
                          },
                          child: const Text(
                            "Ver",
                            style: TextStyle(
                              color: AppColors.secondTextColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Actor",
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
