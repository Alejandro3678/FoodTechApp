import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/auth_services.dart';
import 'package:food_tech_app/screens/autenticacion/modificar_password/pantalla_modificar_password.dart';
import 'package:food_tech_app/screens/autenticacion/registro/pantalla_registro.dart';
import 'package:food_tech_app/screens/principal/pantalla.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_text_field.dart';
import 'package:food_tech_app/widgets/custom_text_label.dart';
import 'package:food_tech_app/widgets/show_snackbar.dart';

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

  bool isLoading = false;

  void logueoUsuario() async {
    final String correo = _correoController.text.trim();
    final String password = _passwordController.text.trim();

    // Verificamos que los campos no sean vacíos
    if (correo.isNotEmpty && password.isNotEmpty) {
      setState(() {
        isLoading = true; // Cambia a true al iniciar el login
      });

      AuthServices().inicioSesion(correo, password).then((value) {
        setState(() {
          isLoading = false; // Cambia a false después de recibir respuesta
        });

        if (value == "Bienvenido") {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainApp()),
            (route) => false,
          );
        } else {
          showSnackBar(context, value, Colors.red);
        }
      });
    } else {
      showSnackBar(context, "Por favor completa todos los campos", Colors.red);
    }
  }

  void limpiarCampos() {
    _correoController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading == false
          ? Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
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
                    ),
                    const SizedBox(height: 10.0),
                    const EtiquetaTextoBase(etiqueta: "Contraseña"),
                    CustomTextFormField(
                      controller: _passwordController,
                      textoHint: "Ingrese su contraseña",
                      tipoTextInputType: TextInputType.text,
                      textoOculto: true,
                    ),
                    const SizedBox(height: 30.0),
                    const EnlaceRecuperarCredencial(),
                    const SizedBox(height: 90.0),
                    BotonIniciarSesion(
                      onPressed: () {
                        logueoUsuario();
                        limpiarCampos();
                      },
                    ),
                    const SizedBox(height: 30.0),
                    const EnlaceRegistrarse(),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(
              color: AppColors.naranja,
            )),
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PantallaModificarPassword()));
            },
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
  final VoidCallback onPressed;
  final String textoBoton = "Iniciar Sesión";

  const BotonIniciarSesion({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
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
              //Agregamos opción de ir a pantalla registro
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PantallaRegistro(),
                ),
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
