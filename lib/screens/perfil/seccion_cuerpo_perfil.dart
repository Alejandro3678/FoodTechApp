import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/auth_services.dart';
import 'package:food_tech_app/firebase_services/firestore_services.dart';
import 'package:food_tech_app/screens/perfil/custom_label_text.dart';
import 'package:food_tech_app/screens/perfil/pantalla_modificar_perfil.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_seccion_encabezado.dart';
import 'package:food_tech_app/widgets/show_snackbar.dart';

//Clase donde construimos la seccion del cuerpo de la pantalla perfil.
class SeccionCuerpoPerfil extends StatefulWidget {
  const SeccionCuerpoPerfil({
    super.key,
  });

  @override
  State<SeccionCuerpoPerfil> createState() => _SeccionCuerpoPerfilState();
}

class _SeccionCuerpoPerfilState extends State<SeccionCuerpoPerfil> {
  final FirestoreService _perfil = FirestoreService();
  String nombresUsuario = "";
  String apellidosUsuario = "";
  String correoUsuario = "";
  String telefonoUsuario = "";

  /*
  Definimos variables donde almacenamos el titulo y logo 
  del encabezado de la pantalla.
  */
  final String titulo = "PERFIL USUARIO";

  final String logo = "assets/img/logo_perfil.png";

  @override
  void initState() {
    super.initState();
    //Obtenemos el ID del usuario autenticado
    String userId = AuthServices().auth.currentUser!.uid;
    cargarDatosUsuario(userId);
  }

  Future<void> cargarDatosUsuario(String userId) async {
    try {
      DocumentSnapshot userDoc = await _perfil.getUserData(userId);
      if (userDoc.exists) {
        setState(() {
          nombresUsuario = userDoc["Nombres"];
          apellidosUsuario = userDoc["Apellidos"];
          telefonoUsuario = userDoc["Telefono"];
          correoUsuario = userDoc["Correo"];
        });
      } else {
        showSnackBar(
            context, "El documento del usuario no existe", AppColors.rojo);
      }
    } catch (e) {
      showSnackBar(
          context, "Error, al cargar los datos del usuario $e", AppColors.rojo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*
              Mandamos los valores de las variables definidas para los 
              parametros requeridos de la clase SeccionEncabezado.
              */
              SeccionEncabezado(
                tituloPantalla: titulo,
                rutaLogo: logo,
              ),
              const SizedBox(height: 10.0),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.grisOscuro,
                ),
                width: 500.0,
                height: 600.0,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "INFORMACIÓN",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.blanco,
                        fontFamily: "Actor",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: AppColors.naranja,
                      thickness: 1.0,
                      height: 5.0,
                    ),
                    const SizedBox(height: 15.0),
                    Center(
                      child: Image.asset(
                        "assets/img/icono_rico_app.png",
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomLabelText(
                            texto: "NOMBRES:",
                            negrita: FontWeight.bold,
                          ),
                          CustomLabelText(
                              texto: nombresUsuario.toString().toUpperCase()),
                          const SizedBox(height: 10.0),
                          const CustomLabelText(
                            texto: "APELLIDOS:",
                            negrita: FontWeight.bold,
                          ),
                          CustomLabelText(
                              texto: apellidosUsuario.toString().toUpperCase()),
                          const SizedBox(height: 10.0),
                          const CustomLabelText(
                            texto: "TELÉFONO:",
                            negrita: FontWeight.bold,
                          ),
                          CustomLabelText(
                            texto: telefonoUsuario,
                          ),
                          const SizedBox(height: 10.0),
                          const CustomLabelText(
                            texto: "CORREO ELECTRÓNICO:",
                            negrita: FontWeight.bold,
                          ),
                          CustomLabelText(
                            texto: correoUsuario,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const Divider(
                      color: AppColors.naranja,
                      thickness: 1.0,
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 15.0,
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          //Dirige a pantalla modificar perfil
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PantallaModificarPerfil(
                                userId: AuthServices().auth.currentUser!.uid,
                                nombresActual: nombresUsuario,
                                apellidosActual: apellidosUsuario,
                                telefonoActual: telefonoUsuario,
                              ),
                            ),
                          ).then((_) {
                            cargarDatosUsuario(
                                AuthServices().auth.currentUser!.uid);
                          });
                        },
                        style: const ButtonStyle(
                          overlayColor: WidgetStatePropertyAll(
                            AppColors.blanco,
                          ),
                        ),
                        icon: const Icon(
                          Icons.edit_sharp,
                          color: AppColors.naranja,
                          size: 25.0,
                        ),
                        label: const Text(
                          "EDITAR INFORMACIÓN",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: AppColors.naranja,
                            fontFamily: "Actor",
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: AppColors.naranja,
                      thickness: 1.0,
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 15.0,
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        style: const ButtonStyle(
                          overlayColor: WidgetStatePropertyAll(
                            AppColors.blanco,
                          ),
                        ),
                        icon: const Icon(
                          Icons.lock,
                          color: AppColors.naranja,
                          size: 25.0,
                        ),
                        label: const Text(
                          "CAMBIAR CONTRASEÑA",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: AppColors.naranja,
                            fontFamily: "Actor",
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: AppColors.naranja,
                      thickness: 1.0,
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
