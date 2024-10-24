import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

class TarjetasPedidos extends StatefulWidget {
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
  int incrementadorComida = 1;

  void decrementar(StateSetter actualizarEstadoDialogo) {
    if (incrementadorComida > 1) {
      actualizarEstadoDialogo(() {
        incrementadorComida--;
      });
    }
  }

  void incrementar(StateSetter actualizarEstadoDialogo) {
    actualizarEstadoDialogo(() {
      incrementadorComida++;
    });
  }

  void mostrarDialogModificar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, StateSetter setState) {
            return AlertDialog(
              title: Text(
                'Modificar ${widget.tituloComida}',
                style: const TextStyle(
                  color: AppColors.negro,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Actor",
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    widget.imagenComida,
                    width: 120.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    widget.descripcionComida,
                    style: const TextStyle(
                      color: AppColors.grisOscuro,
                      fontSize: 13.0,
                      fontFamily: "Actor",
                    ),
                  ),
                  const SizedBox(height: 20.0),
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
                        style: const TextStyle(
                          color: AppColors.negro,
                          fontSize: 15.0,
                          fontFamily: "Allerta",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          incrementar(setState);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Precio Total: \$ ${(widget.precioComida * incrementadorComida).toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: AppColors.naranja,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Actor",
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      color: AppColors.naranja,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Actor",
                    ),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.naranja,
                    ),
                    elevation: WidgetStatePropertyAll(5.0),
                  ),
                  onPressed: () {
                    // Aquí puedes agregar la funcionalidad de actualizar el carrito con la nueva cantidad
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Guardar",
                    style: TextStyle(
                      color: AppColors.blanco,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Actor",
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;

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
                width: isSmallScreen ? 80 : 120,
                height: isSmallScreen ? 60 : 80,
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
                      color: AppColors.negro,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Actor",
                    ),
                  ),
                  Text(
                    widget.descripcionComida,
                    style: const TextStyle(
                      color: AppColors.negro,
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
                          color: AppColors.naranja,
                          fontSize: 18.0,
                          fontFamily: "Allerta",
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit,
                                color: AppColors.naranja),
                            onPressed: () {
                              mostrarDialogModificar(context);
                            },
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.delete, color: AppColors.rojo),
                            onPressed: () {
                              // Acción para eliminar
                              print('Eliminar ${widget.tituloComida}');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
