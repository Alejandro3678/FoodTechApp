import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String textoHint;
  final TextInputType tipoTextInputType;
  final bool textoOculto;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.textoHint,
    required this.tipoTextInputType,
    this.textoOculto = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: textoOculto,
      decoration: InputDecoration(
        //HintText
        hintText: textoHint,
        hintStyle: const TextStyle(
          color: AppColors.grisOscuro,
          fontFamily: "Actor",
          fontSize: 16.0,
        ),
        //Configuramos los bordes y color del TextField
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: AppColors.naranja, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: AppColors.naranja, width: 1.0),
        ),
        //Si queremos que el fondo del textformfield lleve color
        filled: true,
        fillColor: const Color(0xFFe5e5e5),
      ),
      cursorColor: AppColors.naranja,
      keyboardType: tipoTextInputType,
    );
  }
}
