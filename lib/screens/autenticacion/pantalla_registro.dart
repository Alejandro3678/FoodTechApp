import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/componentes/custom_text_field.dart';
import 'package:food_tech_app/widgets/componentes/custom_text_label.dart';

class PantallaRegistro extends StatelessWidget {
  const PantallaRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SeccionLogo(),
                SeccionTitulos(),
                SeccionContenedor(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SeccionContenedor extends StatelessWidget {
  const SeccionContenedor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.primaryBorderColor, width: 3),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EtiquetaTextoBase(etiqueta: "Nombres:"),
          CajaTextoBase(textoHint: "Ingrese sus nombres"),
          SizedBox(height: 5),
          EtiquetaTextoBase(etiqueta: "Apellidos:"),
          CajaTextoBase(textoHint: "Ingrese sus apellidos"),
          SizedBox(height: 5),
          EtiquetaTextoBase(etiqueta: "Usuario:"),
          CajaTextoBase(textoHint: "Ingrese un nombre de usuario"),
          SizedBox(height: 5),
          EtiquetaTextoBase(etiqueta: "Contraseña:"),
          CajaTextoBase(
            textoHint: "Ingrese una contraseña",
            textoOculto: true,
          ),
          SizedBox(height: 5),
          EtiquetaTextoBase(etiqueta: "Confirma tu contraseña:"),
          CajaTextoBase(
            textoHint: "Reescribe tu contraseña",
            textoOculto: true,
          ),
          SizedBox(height: 50),
          BotonRegistrarse(),
        ],
      ),
    );
  }
}

//Clase que contiene la accion del boton Registrarse
class BotonRegistrarse extends StatelessWidget {
  final String textoBoton = "Registrarse";
  const BotonRegistrarse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(AppColors.buttonBackgroundColor),
            elevation: WidgetStatePropertyAll(10),
          ),
          child: Text(
            textoBoton,
            style: const TextStyle(
              color: AppColors.buttonTextColor,
              fontFamily: "Actor",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

//Clase que contiene la seccion de titulos
class SeccionTitulos extends StatelessWidget {
  final String titulo = "Registrate";
  final String subtitulo = "Por favor llena todos los campos";
  final String textoPregunta = "¿Ya tienes una cuenta?";
  final String textoInicioSesion = "Iniciar Sesión";
  const SeccionTitulos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          style: const TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 38,
            fontFamily: "Allerta",
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              textoPregunta,
              style: const TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: 18,
                fontFamily: "Actor",
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, "/inicioSesion");
              },
              child: Text(
                textoInicioSesion,
                style: const TextStyle(
                  color: AppColors.titleTextColor,
                  fontSize: 18,
                  fontFamily: "Actor",
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryBorderColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          subtitulo,
          style: const TextStyle(
            color: AppColors.subTitleTextColor,
            fontSize: 16,
            fontFamily: "Allerta",
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

//Clase que contiene la seccion del logo
class SeccionLogo extends StatelessWidget {
  final String rutaImagen = "assets/img/logo_rico_app.png";
  const SeccionLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(rutaImagen),
    ));
  }
}
