import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:food_tech_app/firebase_services/firestore_services.dart";
import "package:food_tech_app/screens/categoria/pantalla_productos_categorias.dart";
import "package:food_tech_app/utils/colors.dart";
import "package:food_tech_app/widgets/custom_seccion_encabezado.dart";

class SeccionCuerpoCategoria extends StatelessWidget {
  final String titulo = "CATEGORIAS";
  final String logo = "assets/img/logo_categorias.png";

  const SeccionCuerpoCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 15.0,
            right: 15.0,
            bottom: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SeccionEncabezado(
                tituloPantalla: titulo,
                rutaLogo: logo,
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Selecciona la categoría que deseas ver",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              StreamBuilder<QuerySnapshot>(
                stream: firestoreService.readCategoryData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                        color: AppColors.naranja);
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Text(
                      "No hay Categorias disponibles",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.negro,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  final categorias = snapshot.data!.docs;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categorias.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0),
                    itemBuilder: (context, index) {
                      var categoria = categorias[index];
                      String idCategoria = categoria.id;
                      String nombreCategoria = categoria["NombreCategoria"];
                      String imagenUrl = categoria["ImagenUrl"];

                      return tarjetaCategoria(
                        nombreCategoria,
                        imagenUrl,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PantallaProductosCategorias(
                                idCategoria: idCategoria,
                                nombreCategoria: nombreCategoria,
                              ),
                            ),
                          );
                        },
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

  Widget tarjetaCategoria(
      String nombreCategoria, String imagenCategoria, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.network(
                imagenCategoria,
                width: double.infinity,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              nombreCategoria,
              style: const TextStyle(
                fontFamily: "Actor",
                color: AppColors.negro,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
