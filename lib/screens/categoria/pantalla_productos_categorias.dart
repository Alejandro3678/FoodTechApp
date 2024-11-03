import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_tech_app/firebase_services/firestore_services.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_appbar_two.dart';
import 'package:food_tech_app/widgets/custom_card_productos_categorias.dart';

class PantallaProductosCategorias extends StatelessWidget {
  final String idCategoria;
  final String nombreCategoria;

  const PantallaProductosCategorias({
    super.key,
    required this.idCategoria,
    required this.nombreCategoria,
  });

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return Scaffold(
      appBar: CustomAppbarTwo(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15.0,
          ),
          child: Column(
            children: [
              Text(
                nombreCategoria,
                style: const TextStyle(
                  fontSize: 22.0,
                  color: AppColors.naranja,
                  fontFamily: "Allerta",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              StreamBuilder<QuerySnapshot>(
                stream: firestoreService.readProductsByCategory(idCategoria),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.naranja,
                    ));
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No hay productos disponibles en esta categoría.",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.negro,
                          fontFamily: "Actor",
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    );
                  }

                  final productos = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap:
                        true, 
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
