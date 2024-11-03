import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/firestore_services.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_appbar_two.dart';
import 'package:food_tech_app/widgets/custom_text_field.dart';
import 'package:food_tech_app/widgets/custom_text_label.dart';
import 'package:food_tech_app/widgets/show_snackbar.dart';

class PantallaModificarPerfil extends StatefulWidget {
  final String userId;
  final String nombresActual;
  final String apellidosActual;
  final String telefonoActual;

  const PantallaModificarPerfil({
    super.key,
    required this.userId,
    required this.nombresActual,
    required this.apellidosActual,
    required this.telefonoActual,
  });

  @override
  State<PantallaModificarPerfil> createState() =>
      _PantallaModificarPerfilState();
}

class _PantallaModificarPerfilState extends State<PantallaModificarPerfil> {
  late TextEditingController _nombresModificadoController;
  late TextEditingController _apellidosModificadoController;
  late TextEditingController _telefonoModificadoController;

  @override
  void initState() {
    super.initState();
    _nombresModificadoController =
        TextEditingController(text: widget.nombresActual);
    _apellidosModificadoController =
        TextEditingController(text: widget.apellidosActual);
    _telefonoModificadoController =
        TextEditingController(text: widget.telefonoActual);
  }

  @override
  void dispose() {
    _nombresModificadoController.dispose();
    _apellidosModificadoController.dispose();
    _telefonoModificadoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarTwo(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                "EDITAR INFORMACIÓN",
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.negro,
                  fontFamily: "Actor",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: AppColors.naranja,
                thickness: 1.0,
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const EtiquetaTextoBase(etiqueta: "NOMBRES:"),
                    const SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: _nombresModificadoController,
                      textoHint: "",
                      tipoTextInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 15.0),
                    const EtiquetaTextoBase(etiqueta: "APELLIDOS:"),
                    const SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: _apellidosModificadoController,
                      textoHint: "",
                      tipoTextInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 15.0),
                    const EtiquetaTextoBase(etiqueta: "TELÉFONO:"),
                    const SizedBox(height: 5.0),
                    CustomTextFormField(
                      controller: _telefonoModificadoController,
                      textoHint: "",
                      tipoTextInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 100.0),
                    ElevatedButton(
                      onPressed: () async {
                        await FirestoreService().updateUserData(
                          widget.userId,
                          _nombresModificadoController.text,
                          _apellidosModificadoController.text,
                          _telefonoModificadoController.text,
                        );
                        showSnackBar(
                            context, "Se actualizarón los datos", Colors.green);
                        Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.naranja),
                        elevation: WidgetStatePropertyAll(10.0),
                      ),
                      child: const Text(
                        "GUARDAR",
                        style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
