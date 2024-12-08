import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/firestore_services.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_card_productos_categorias.dart';
import 'package:food_tech_app/widgets/custom_seccion_encabezado.dart';

//Clase donde construimos la seccion del cuerpo de la pantalla menú.
class SeccionCuerpoMenu extends StatefulWidget {
  const SeccionCuerpoMenu({super.key});

  @override
  State<SeccionCuerpoMenu> createState() => _SeccionCuerpoMenuState();
}

class _SeccionCuerpoMenuState extends State<SeccionCuerpoMenu> {
  /*
  Definimos variables donde almacenamos el titulo y logo 
  del encabezado de la pantalla.
  */
  final String titulo = "MENÚ DE COMIDAS";

  final String logo = "assets/img/logo_menu.png";

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

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
              StreamBuilder<QuerySnapshot>(
                stream: firestoreService.readAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.naranja,
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No hay productos disponibles.",
                        style: TextStyle(
                          color: AppColors.negro,
                          fontSize: 18.0,
                          fontFamily: "Actor",
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    );
                  }

                  final productos = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productos.length,
                    itemBuilder: (context, index) {
                      var producto = productos[index];
                      String nombreProducto = producto["NombreProducto"];
                      String imagenProducto = producto["ImagenProducto"];
                      String descripcionProducto =
                          producto["DescripcionProducto"];
                      double precioProducto = producto["PrecioProducto"];

                      return TarjetaProductosCategorias(
                        imagenComida: imagenProducto,
                        tituloComida: nombreProducto,
                        descripcionComida: descripcionProducto,
                        precioComida: precioProducto,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
