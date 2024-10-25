import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_text_field.dart';
import 'package:food_tech_app/widgets/custom_text_label.dart';

class SeccionCuerpoRegistro extends StatefulWidget {
  const SeccionCuerpoRegistro({
    super.key,
  });

  @override
  State<SeccionCuerpoRegistro> createState() => _SeccionCuerpoRegistroState();
}

class _SeccionCuerpoRegistroState extends State<SeccionCuerpoRegistro> {
  //Controladores para Cajas de Texto
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
              const EtiquetaTextoBase(etiqueta: "Nombres:"),
              CustomTextFormField(
                controller: _nombreController,
                textoHint: "Ingrese sus nombres",
                tipoTextInputType: TextInputType.name,
              ),
              const SizedBox(height: 10.0),
              const EtiquetaTextoBase(etiqueta: "Apellidos:"),
              CustomTextFormField(
                controller: _apellidoController,
                textoHint: "Ingrese sus apellidos",
                tipoTextInputType: TextInputType.name,
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
              const SizedBox(height: 10.0),
              const EtiquetaTextoBase(etiqueta: "Confirma tu contraseña:"),
              CustomTextFormField(
                controller: _confirmPasswordController,
                textoHint: "Confirme su contraseña",
                tipoTextInputType: TextInputType.text,
                textoOculto: true,
              ),
              const SizedBox(height: 30.0),
              const BotonRegistrarse(),
            ],
          ),
        ),
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
