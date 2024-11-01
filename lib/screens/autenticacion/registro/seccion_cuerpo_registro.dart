import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/auth_services.dart';
import 'package:food_tech_app/screens/principal/pantalla.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_text_field.dart';
import 'package:food_tech_app/widgets/custom_text_label.dart';
import 'package:food_tech_app/widgets/show_snackbar.dart';

class SeccionCuerpoRegistro extends StatefulWidget {
  const SeccionCuerpoRegistro({
    super.key,
  });

  @override
  State<SeccionCuerpoRegistro> createState() => _SeccionCuerpoRegistroState();
}

class _SeccionCuerpoRegistroState extends State<SeccionCuerpoRegistro> {
  //Controladores para Cajas de Texto
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  bool isLoading = false;

  void registrarUsuario() async {
    final String nombres = _nombresController.text.trim();
    final String apellidos = _apellidosController.text.trim();
    final String telefono = _telefonoController.text.trim();
    final String correo = _correoController.text.trim();
    final String password = _passwordController.text.trim();

    //Verificamos que los campos no sean vacios
    if (nombres.isNotEmpty &&
        apellidos.isNotEmpty &&
        telefono.isNotEmpty &&
        correo.isNotEmpty &&
        password.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      AuthServices()
          .crearCuenta(correo, password, nombres, apellidos, telefono)
          .then((value) {
        if (value == "Cuenta creada exitosamente") {
          setState(() {
            isLoading = false;
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainApp()),
            (route) => false,
          );
        } else {
          setState(() {
            isLoading = false;
          });
          showSnackBar(
              context,
              value,
              value ==
                      "Cuenta creada exitosamente. Por favor, verifica tu correo electrónico."
                  ? Colors.green
                  : Colors.red);
        }
      });
    } else {
      showSnackBar(context, "Por favor, llena todos los campos", Colors.red);
    }
  }

  void limpiarCampos() {
    _nombresController.clear();
    _apellidosController.clear();
    _telefonoController.clear();
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
                    const EtiquetaTextoBase(etiqueta: "Nombres:"),
                    CustomTextFormField(
                      controller: _nombresController,
                      textoHint: "Ingrese sus nombres",
                      tipoTextInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 10.0),
                    const EtiquetaTextoBase(etiqueta: "Apellidos:"),
                    CustomTextFormField(
                      controller: _apellidosController,
                      textoHint: "Ingrese sus apellidos",
                      tipoTextInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 10.0),
                    const EtiquetaTextoBase(etiqueta: "Teléfono:"),
                    CustomTextFormField(
                      controller: _telefonoController,
                      textoHint: "0000-0000",
                      tipoTextInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 10.0),
                    const EtiquetaTextoBase(etiqueta: "Correo Electrónico:"),
                    CustomTextFormField(
                      controller: _correoController,
                      textoHint: "Ingrese su correo electrónico",
                      tipoTextInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 10.0),
                    const EtiquetaTextoBase(etiqueta: "Contraseña:"),
                    CustomTextFormField(
                      controller: _passwordController,
                      textoHint: "Ingrese su contraseña",
                      tipoTextInputType: TextInputType.text,
                      textoOculto: true,
                    ),
                    const SizedBox(height: 30.0),
                    BotonRegistrarse(
                      onPressed: () {
                        registrarUsuario();
                        limpiarCampos();
                      },
                    ),
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

//Clase que contiene la accion del boton Registrarse
class BotonRegistrarse extends StatelessWidget {
  final VoidCallback onPressed;
  final String textoBoton = "Registrarse";
  const BotonRegistrarse({
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
            backgroundColor: WidgetStatePropertyAll(AppColors.naranja),
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
