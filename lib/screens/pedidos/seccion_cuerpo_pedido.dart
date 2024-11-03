import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/auth_services.dart';
import 'package:food_tech_app/firebase_services/firestore_services.dart';
import 'package:food_tech_app/generar_pdf/generar_pdf.dart';
import 'package:food_tech_app/generar_pdf/permisos_almacenamiento.dart';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_provider.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_card_productos_pedidos.dart';
import 'package:food_tech_app/widgets/custom_seccion_encabezado.dart';
import 'package:food_tech_app/widgets/show_snackbar.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

//Clase donde construimos la seccion del cuerpo de la pantalla menú.
class SeccionCuerpoPedido extends StatelessWidget {
  final String titulo = "Pedidos realizados";
  final String logo = "assets/img/logo_pedidos.png";
  const SeccionCuerpoPedido({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SeccionEncabezado(
                tituloPantalla: titulo,
                rutaLogo: logo,
              ),
              SizedBox(height: 10.0),
              Divider(color: AppColors.naranja, thickness: 2.0),
              Text(
                "DETALLE DE TU ORDEN:",
                style: TextStyle(
                  color: AppColors.grisOscuro,
                  fontFamily: "Actor",
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.5,
                ),
              ),
              Divider(color: AppColors.naranja, thickness: 2.0),
              cartItems.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Todavía no hay productos agregados en el carrito.",
                        style: TextStyle(
                          color: AppColors.negro,
                          fontSize: 18.0,
                          fontFamily: "Actor",
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return TarjetaProductosPedidos(
                          imagenComida: item.imagenComida,
                          tituloComida: item.tituloComida,
                          descripcionComida: item.descripcionComida,
                          precioComida: item.precioComida,
                          cantidad: item.cantidad,
                          onDelete: () {
                            cartProvider.removeItem(item);
                          },
                          onQuantityChanged: (newQuantity) {
                            cartProvider.updateQuantity(item, newQuantity);
                          },
                        );
                      },
                    ),
              Divider(color: AppColors.naranja, height: 70.0, thickness: 2.0),
              if (cartItems.isNotEmpty) ...[
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "TOTAL",
                            style: TextStyle(
                              color: AppColors.negro,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "\$ ${cartProvider.total.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: AppColors.naranja,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            AppColors.buttonBackgroundColor,
                          ),
                          elevation: MaterialStatePropertyAll(5.0),
                        ),
                        onPressed: () async {
                          // Solicitar permiso de almacenamiento antes de procesar el pago
                          await requestStoragePermission();

                          // Mostrar diálogo de confirmación
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Confirmar Pedido"),
                                content: Text(
                                    "¿Está seguro de que desea procesar el pago?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Cerrar el diálogo
                                    },
                                    child: Text("Cancelar"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      Navigator.of(context)
                                          .pop(); // Cerrar el diálogo

                                      final userId =
                                          AuthServices().auth.currentUser!.uid;

                                      // Obtén los detalles del usuario (por ejemplo, nombre y apellido)
                                      final userDoc = await FirestoreService()
                                          .getUserData(userId);
                                      final userName = userDoc[
                                          'Nombres']; // Ajusta según tu estructura de Firestore
                                      final userSurname = userDoc[
                                          'Apellidos']; // Ajusta según tu estructura de Firestore

                                      await FirestoreService().createOrder(
                                        userId: userId,
                                        products: cartProvider.items,
                                        total: cartProvider.total,
                                        estado: false,
                                        fechaPedido: DateTime.now(),
                                      );

                                      // Generar el PDF y guardar los bytes
                                      final pdfBytes = await generatePdf(
                                        cartProvider.items,
                                        cartProvider.total,
                                        userName,
                                        userSurname,
                                      );

                                      // Opción para descargar el PDF
                                      await Printing.sharePdf(
                                          bytes: pdfBytes,
                                          filename:
                                              'pedido_${DateTime.now().millisecondsSinceEpoch}.pdf');

                                      //Limpiar interfaz carrito
                                      cartProvider.clearCart();

                                      showSnackBar(
                                          context,
                                          "¡Pedido realizado con éxito!",
                                          Colors.green);
                                    },
                                    child: Text("Confirmar"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          "PROCESAR PAGO",
                          style: TextStyle(
                            color: AppColors.secondTextColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Actor",
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            AppColors.buttonBackgroundColor,
                          ),
                          elevation: MaterialStatePropertyAll(5.0),
                        ),
                        onPressed: () {
                          cartProvider.clearCart();
                        },
                        child: const Text(
                          "LIMPIAR CARRITO",
                          style: TextStyle(
                            color: AppColors.secondTextColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Actor",
                          ),
                        ),
                      ),
                      Divider(
                          color: AppColors.naranja,
                          height: 70.0,
                          thickness: 2.0),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
