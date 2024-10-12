import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_text_field.dart';
import 'package:food_tech_app/widgets/custom_text_label.dart';

class PantallaInicioSesion extends StatelessWidget {
  const PantallaInicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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

//Clase que contiene la sección de contenedor que contiene los
//textfield, button, etc.
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
          EtiquetaTextoBase(etiqueta: "Usuario"),
          SizedBox(height: 3),
          CajaTextoBase(
            textoHint: "Ingrese su usuario",
            icono: Icons.person,
          ),
          SizedBox(height: 10),
          EtiquetaTextoBase(etiqueta: "Contraseña"),
          SizedBox(height: 3),
          CajaTextoBase(
            textoHint: "Ingrese su contraseña",
            icono: Icons.lock,
            textoOculto: true,
          ),
          SizedBox(height: 30),
          EnlaceRecuperarCredencial(),
          SizedBox(height: 120),
          BotonIniciarSesion(),
          SizedBox(height: 35),
          EnlaceRegistrarse()
        ],
      ),
    );
  }
}

//Clase que contiene el texto que dirige a la pantalla de registro
class EnlaceRegistrarse extends StatelessWidget {
  final String textoPregunta = "¿No estas registrado?";
  final String textoRegistro = "Registrate";

  const EnlaceRegistrarse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textoPregunta,
            style: const TextStyle(
              color: AppColors.primaryTextColor,
              fontFamily: "Actor",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/registro");
            },
            child: Text(
              textoRegistro,
              style: const TextStyle(
                color: AppColors.titleTextColor,
                fontFamily: "Actor",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryBorderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Clase que contiene el boton de iniciar sesión
class BotonIniciarSesion extends StatelessWidget {
  final String textoBoton = "Iniciar Sesión";

  const BotonIniciarSesion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/principal");
          },
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

//Clase que contiene los textos de recuperar credenciales
class EnlaceRecuperarCredencial extends StatelessWidget {
  final String textoPregunta = "¿Olvidaste tu contraseña?";
  final String textoRecuperar = "Presiona aquí";

  const EnlaceRecuperarCredencial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            textoPregunta,
            style: const TextStyle(
              color: AppColors.primaryTextColor,
              fontFamily: "Actor",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              textoRecuperar,
              style: const TextStyle(
                color: AppColors.titleTextColor,
                fontFamily: "Actor",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryBorderColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Clase que contiene la sección de titulos
class SeccionTitulos extends StatelessWidget {
  final String titulo = "Iniciar Sesión";
  final String subtitulo = "Bienvenido/a";

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
        Text(
          subtitulo,
          style: const TextStyle(
            color: AppColors.subTitleTextColor,
            fontSize: 16,
            fontFamily: "Allerta",
            letterSpacing: 5,
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

//Clase que contiene la sección del logo
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
      ),
    );
  }
}
