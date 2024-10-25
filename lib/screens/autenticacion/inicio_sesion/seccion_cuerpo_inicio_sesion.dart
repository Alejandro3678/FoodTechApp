import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_text_field.dart';
import 'package:food_tech_app/widgets/custom_text_label.dart';

class SeccionCuerpoInicioSesion extends StatefulWidget {
  const SeccionCuerpoInicioSesion({super.key});

  @override
  State<SeccionCuerpoInicioSesion> createState() =>
      _SeccionCuerpoInicioSesionState();
}

class _SeccionCuerpoInicioSesionState extends State<SeccionCuerpoInicioSesion> {
  //Controladores de Cajas de Texto
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        width: 500.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(
            color: AppColors.naranja,
            width: 3.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 20.0,
            right: 20.0,
            bottom: 50.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EtiquetaTextoBase(etiqueta: "Correo Electrónico"),
              CustomTextFormField(
                controller: _correoController,
                textoHint: "Ingrese su correo",
                tipoTextInputType: TextInputType.emailAddress,
                textoOculto: false,
              ),
              const SizedBox(height: 10.0),
              const EtiquetaTextoBase(etiqueta: "Contraseña"),
              CustomTextFormField(
                controller: _passwordController,
                textoHint: "Ingrese su contraseña",
                tipoTextInputType: TextInputType.text,
                textoOculto: false,
              ),
              const SizedBox(height: 30.0),
              const EnlaceRecuperarCredencial(),
              const SizedBox(height: 90.0),
              const BotonIniciarSesion(),
              const SizedBox(height: 30.0),
              const EnlaceRegistrarse(),
            ],
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
              color: AppColors.negro,
              fontFamily: "Actor",
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              textoRecuperar,
              style: const TextStyle(
                color: AppColors.naranja,
                fontFamily: "Actor",
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.naranja,
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
            Navigator.pushReplacementNamed(
              context,
              "/principal",
            );
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              AppColors.naranja,
            ),
            elevation: WidgetStatePropertyAll(10.0),
          ),
          child: Text(
            textoBoton,
            style: const TextStyle(
              color: AppColors.blanco,
              fontFamily: "Actor",
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
              color: AppColors.negro,
              fontFamily: "Actor",
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10.0),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                "/registro",
              );
            },
            child: Text(
              textoRegistro,
              style: const TextStyle(
                color: AppColors.naranja,
                fontFamily: "Actor",
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.naranja,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
