import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_appbar_two.dart';
import 'package:food_tech_app/widgets/custom_text_field.dart';
import 'package:food_tech_app/widgets/custom_text_label.dart';

class PantallaModificarPerfil extends StatefulWidget {
  const PantallaModificarPerfil({super.key});

  @override
  State<PantallaModificarPerfil> createState() =>
      _PantallaModificarPerfilState();
}

class _PantallaModificarPerfilState extends State<PantallaModificarPerfil> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _dateBirthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarTwo(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EtiquetaTextoBase(etiqueta: "NOMBRE:"),
                    CustomTextFormField(
                      controller: _nombreController,
                      textoHint: "",
                      tipoTextInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 15.0),
                    const EtiquetaTextoBase(etiqueta: "APELLIDO:"),
                    CustomTextFormField(
                      controller: _apellidoController,
                      textoHint: "",
                      tipoTextInputType: TextInputType.name,
                    ),
                    const SizedBox(height: 15.0),
                    const EtiquetaTextoBase(etiqueta: "TELÉFONO:"),
                    CustomTextFormField(
                      controller: _telefonoController,
                      textoHint: "",
                      tipoTextInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 15.0),
                    const EtiquetaTextoBase(etiqueta: "FECHA CUMPLEAÑOS:"),
                    CustomTextFormField(
                      controller: _dateBirthdayController,
                      textoHint: "",
                      tipoTextInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 100.0),
                    ElevatedButton(
                      onPressed: () {},
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
