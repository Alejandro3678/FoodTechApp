import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_text_field.dart';
import 'package:food_tech_app/widgets/custom_text_label.dart';

class SeccionCuerpoRegistro extends StatelessWidget {
  const SeccionCuerpoRegistro({
    super.key,
  });

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
        child: const Padding(
          padding: EdgeInsets.only(
            top: 20.0,
            left: 20.0,
            right: 20.0,
            bottom: 50.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EtiquetaTextoBase(etiqueta: "Nombres:"),
              CajaTextoBase(textoHint: "Ingrese sus nombres"),
              SizedBox(height: 10.0),
              EtiquetaTextoBase(etiqueta: "Apellidos:"),
              CajaTextoBase(textoHint: "Ingrese sus apellidos"),
              SizedBox(height: 10.0),
              EtiquetaTextoBase(etiqueta: "Correo Electrónico:"),
              CajaTextoBase(textoHint: "Ingrese un nombre de usuario"),
              SizedBox(height: 10.0),
              EtiquetaTextoBase(etiqueta: "Contraseña:"),
              CajaTextoBase(
                textoHint: "Ingrese una contraseña",
                textoOculto: true,
              ),
              SizedBox(height: 10.0),
              EtiquetaTextoBase(etiqueta: "Confirma tu contraseña:"),
              CajaTextoBase(
                textoHint: "Reescribe tu contraseña",
                textoOculto: true,
              ),
              SizedBox(height: 30.0),
              BotonRegistrarse(),
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
