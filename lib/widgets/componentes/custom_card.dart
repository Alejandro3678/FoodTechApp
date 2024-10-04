import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

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
                      dialogBuilder(context);
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
                            dialogBuilder(context);
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

  /*
  Función de tipo Future donde construimos el widget Dialog que es 
  la ventana emergente que sale cuando se presiona el botón de "Ver" en las
  tarjetas. 
  */
  Future<void> dialogBuilder(BuildContext context) {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            /*
            Con el widget StatefulBuilder podemos mandar como parametros el 
            contexto y el estado del dialog en este caso el del incrementador
            de comida y multiplicación de precio por incrementador.
            */
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.network(
                            widget.imagenComida,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.tituloComida,
                        style: const TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Actor",
                        ),
                      ),
                      Text(
                        widget.descripcionComida,
                        style: const TextStyle(
                          color: AppColors.subTitleTextColor,
                          fontSize: 13.0,
                          fontFamily: "Actor",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "CANTIDAD",
                            style: TextStyle(
                              color: AppColors.subTitleTextColor,
                              fontSize: 12.0,
                              fontFamily: "Actor",
                              letterSpacing: 1.0,
                            ),
                          ),
                          //IconButton que decrementa la variable
                          //incrementadorComida.
                          IconButton(
                            onPressed: () => decrementar(setState),
                            icon: const Icon(Icons.remove),
                          ),
                          //Aquí se muestra la variable incrementadorComida.
                          Text(
                            "$incrementadorComida",
                            style: const TextStyle(
                              color: AppColors.primaryTextColor,
                              fontSize: 15.0,
                              fontFamily: "Allerta",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //IconButton que incrementa la variable
                          //incrementadorComida.
                          IconButton(
                            onPressed: () => incrementar(setState),
                            icon: const Icon(Icons.add),
                          ),
                          //Aquí se muestra la multiplicacion del precio de
                          //la comida con la incrementadorComida.
                          Text(
                            "\$ ${widget.precioComida * incrementadorComida}",
                            style: const TextStyle(
                              color: AppColors.titleTextColor,
                              fontSize: 18.0,
                              fontFamily: "Allerta",
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.buttonBackgroundColor,
                            ),
                            elevation: WidgetStatePropertyAll(5.0),
                          ),
                          onPressed: () {
                            /*
                            Una vez que se presiona el boton añadir al carrito
                            se cierra y muestra la pantalla principal del menú y
                            se muestra el SnackBar con el mensaje de que se 
                            añadio al carrito dicha comida mencionada.
                            */
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/img/icono_rico_app.png",
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "PRODUCTO AGREGADO A TU CARRITO",
                                          style: TextStyle(
                                            color: AppColors.titleTextColor,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Actor",
                                          ),
                                        ),
                                        Text(
                                          widget.tituloComida.toUpperCase(),
                                          style: const TextStyle(
                                            color: AppColors.subTitleTextColor,
                                            fontSize: 12.0,
                                            fontFamily: "Actor",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            "Añadir al carrito",
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
                  ),
                );
              },
            ),
          ),
        );
      },
    )
        /*
    Con la funcion then() hacemos que una vez se cierre el dialog el incrementador
    de comida se debe reestablecer en 1.
    */
        .then((_) {
      setState(() {
        incrementadorComida = 1;
      });
    });
  }
}