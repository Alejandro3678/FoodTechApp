import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

/*
Clase que hereda de StatefulWidget porque estará cambiando de estado.
*/
class TarjetasPedidos extends StatefulWidget {
  //Definimos los atributos que utilizaremos.
  final String imagenComida;
  final String tituloComida;
  final String descripcionComida;
  final double precioComida;

  const TarjetasPedidos({
    required this.imagenComida,
    required this.tituloComida,
    required this.descripcionComida,
    required this.precioComida,
    super.key,
  });

  @override
  State<TarjetasPedidos> createState() => _TarjetasPedidosState();
}

class _TarjetasPedidosState extends State<TarjetasPedidos> {
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

  // Mostrar el dialogo de modificar cantidad
  void mostrarDialogModificar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return AlertDialog(
              title: Text('Modificar ${widget.tituloComida}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    widget.imagenComida,
                    width: 120,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.descripcionComida,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          decrementar(setState);
                        },
                      ),
                      Text(
                        incrementadorComida.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          incrementar(setState);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Precio Total: \$ ${(widget.precioComida * incrementadorComida).toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancelar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la funcionalidad de actualizar el carrito con la nueva cantidad
                    Navigator.of(context).pop();
                  },
                  child: const Text("Guardar"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /*
  Construimos las TarjetasPedidos donde se presentará la imagen, titulo,
  descripción, precio y botones de modificar y eliminar.
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
                  Text(
                    widget.descripcionComida,
                    style: const TextStyle(
                      color: AppColors.secondTextColor,
                      fontSize: 12.0,
                      fontFamily: "Actor",
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
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.buttonBackgroundColor,
                            ),
                            onPressed: () {
                              mostrarDialogModificar(context);
                            },
                            child: const Text(
                              "Modificar",
                              style: TextStyle(
                                color: AppColors.secondTextColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Actor",
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              // Acción para eliminar
                              print('Eliminar ${widget.tituloComida}');
                            },
                            child: const Text(
                              "Eliminar",
                              style: TextStyle(
                                color: AppColors.secondTextColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Actor",
                              ),
                            ),
                          ),
                        ],
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
