import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/auth_services.dart';
import 'package:food_tech_app/screens/autenticacion/inicio_sesion/pantalla_inicio_sesion.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_appbar_two.dart';
import 'package:food_tech_app/widgets/custom_text_field.dart';
import 'package:food_tech_app/widgets/show_snackbar.dart';

class PantallaModificarPassword extends StatefulWidget {
  const PantallaModificarPassword({super.key});

  @override
  State<PantallaModificarPassword> createState() =>
      _PantallaModificarPasswordState();
}

class _PantallaModificarPasswordState extends State<PantallaModificarPassword> {
  final TextEditingController _correoController = TextEditingController();

  bool isLoading = false;

  void reseteoPassword() async {
    final String correo = _correoController.text.trim();

    //Verificamos que los campos no sean vacios
    if (correo.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      AuthServices().cambiarPassword(correo).then((value) {
        if (value == "Se te ha enviado un mensaje a tu bandeja de correo") {
          setState(() {
            isLoading = false;
          });
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const PantallaInicioSesion()),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: CustomAppbarTwo(),
          body: isLoading == false
              ? SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _correoController,
                          textoHint: "Ingrese tu dirección de correo",
                          tipoTextInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 30.0),
                        ElevatedButton(
                          onPressed: reseteoPassword,
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.naranja,
                            ),
                            elevation: WidgetStatePropertyAll(10.0),
                          ),
                          child: Text(
                            "ENVIAR",
                            style: const TextStyle(
                              color: AppColors.blanco,
                              fontFamily: "Actor",
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors.naranja,
                  ),
                )),
    );
  }
}
