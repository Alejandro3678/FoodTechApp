import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/firestore_services.dart';
import 'package:food_tech_app/screens/ofertas/carrusel_ofertas.dart';
import 'package:food_tech_app/screens/ofertas/tarjeta_ofertas.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/show_snackbar.dart';

class SeccionCuerpoOfertas extends StatefulWidget {
  const SeccionCuerpoOfertas({
    super.key,
  });

  @override
  State<SeccionCuerpoOfertas> createState() => _SeccionCuerpoOfertasState();
}

class _SeccionCuerpoOfertasState extends State<SeccionCuerpoOfertas> {
  String? nombresUsuario;
  String? apellidosUsuario;
  String? nombreCompleto;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _mostrarNombreUsuario();
  }

  Future<void> _mostrarNombreUsuario() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot usuarioDoc =
            await FirestoreService().getUserData(user.uid);
        setState(() {
          nombresUsuario = usuarioDoc["Nombres"];
          apellidosUsuario = usuarioDoc["Apellidos"];
          nombreCompleto = "$nombresUsuario $apellidosUsuario";
          isLoading = false;
        });
      }
    } catch (e) {
      showSnackBar(
          context, "Error, al mostrar el nombre del usuario", AppColors.rojo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: isLoading == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "¡Hola, ${nombreCompleto ?? "Usuario"}!",
                      style: const TextStyle(
                        color: AppColors.naranja,
                        fontFamily: "Allerta",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    Divider(
                      color: AppColors.naranja,
                      height: 25.0,
                      thickness: 3.0,
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      "PROMOCIONES DESTACADAS",
                      style: TextStyle(
                        color: AppColors.grisOscuro,
                        fontFamily: "Actor",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const CarruselOfertas(),
                    const SizedBox(height: 15.0),
                    const Text(
                      "MÁS PROMOCIONES PARA TI",
                      style: TextStyle(
                        color: AppColors.grisOscuro,
                        fontFamily: "Actor",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Agregar un StreamBuilder para mostrar las ofertas
                    StreamBuilder<QuerySnapshot>(
                      stream: FirestoreService().readAllOffers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Text("No hay ofertas disponibles.");
                        }

                        return Column(
                          children: snapshot.data!.docs.map((doc) {
                            return TarjetaOfertas(
                              imagenOferta: doc['ImagenOferta'],
                              nombreOferta: doc['NombreOferta'],
                              descripcionOferta: doc['DescripcionOferta'],
                              precioOferta: doc['PrecioOferta'],
                              validezOferta: doc['ValidezOferta'],
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(color: AppColors.naranja)),
        ),
      ),
    );
  }
}
