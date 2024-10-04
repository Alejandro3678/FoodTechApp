import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/componentes/custom_seccion_encabezado.dart';

//Clase donde construimos la seccion del cuerpo de la pantalla perfil.
class SeccionCuerpoPerfil extends StatelessWidget {
  final String nombresUsuario;
  final String apellidosUsuario;
  final String correoUsuario;
  final String telefonoUsuario;
  /*
  Definimos variables donde almacenamos el titulo y logo 
  del encabezado de la pantalla.
  */
  final String titulo = "PERFIL USUARIO";
  final String logo = "assets/img/logo_perfil.png";

  const SeccionCuerpoPerfil(
      {required this.nombresUsuario,
      required this.apellidosUsuario,
      required this.correoUsuario,
      required this.telefonoUsuario,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                margin: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.containerSecondBackgroundColor,
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "INFORMACIÓN",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.secondTextColor,
                        fontFamily: "Actor",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: AppColors.primaryBorderColor,
                      thickness: 1.0,
                      height: 5.0,
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //Botón que navega a pantalla de modificar
                      children: [
                        Image.asset(
                          "assets/img/icono_rico_app.png",
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          style: const ButtonStyle(
                            overlayColor: WidgetStatePropertyAll(
                              AppColors.backgroundColor,
                            ),
                          ),
                          icon: const Icon(
                            Icons.edit_sharp,
                            color: AppColors.containerBackgroundColor,
                            size: 25.0,
                          ),
                          label: const Text(
                            "EDITAR",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: AppColors.titleTextColor,
                              fontFamily: "Actor",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        right: 5.0,
                      ),
                      child: Text(
                        "$nombresUsuario $apellidosUsuario".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: AppColors.secondTextColor,
                          fontFamily: "Actor",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Correo:",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.secondTextColor,
                              fontFamily: "Actor",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            correoUsuario,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: AppColors.secondTextColor,
                              fontFamily: "Actor",
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "Teléfono:",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.secondTextColor,
                              fontFamily: "Actor",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            telefonoUsuario,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: AppColors.secondTextColor,
                              fontFamily: "Actor",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Divider(
                      color: AppColors.primaryBorderColor,
                      thickness: 1.0,
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        bottom: 15.0,
                        left: 30.0,
                        right: 30.0,
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        style: const ButtonStyle(
                          overlayColor: WidgetStatePropertyAll(
                            AppColors.backgroundColor,
                          ),
                        ),
                        icon: const Icon(
                          Icons.mail,
                          color: AppColors.containerBackgroundColor,
                          size: 25.0,
                        ),
                        label: const Text(
                          "CAMBIAR CORREO",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: AppColors.titleTextColor,
                            fontFamily: "Actor",
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: AppColors.primaryBorderColor,
                      thickness: 1.0,
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        bottom: 15.0,
                        left: 30.0,
                        right: 30.0,
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        style: const ButtonStyle(
                          overlayColor: WidgetStatePropertyAll(
                            AppColors.backgroundColor,
                          ),
                        ),
                        icon: const Icon(
                          Icons.lock,
                          color: AppColors.containerBackgroundColor,
                          size: 25.0,
                        ),
                        label: const Text(
                          "CAMBIAR CONTRASEÑA",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: AppColors.titleTextColor,
                            fontFamily: "Actor",
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: AppColors.primaryBorderColor,
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
