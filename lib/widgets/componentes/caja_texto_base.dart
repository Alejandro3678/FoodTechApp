import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

class CajaTextoBase extends StatelessWidget {
  final String textoHint;
  final IconData? icono;
  final bool textoOculto;

  const CajaTextoBase({
    required this.textoHint,
    this.icono,
    this.textoOculto = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: textoOculto,
      decoration: InputDecoration(
        hintText: textoHint,
        hintStyle: const TextStyle(
          color: AppColors.hintTextFieldTextColor,
          fontFamily: "Actor",
          fontSize: 16,
        ),
        //Configuramos los bordes y color del TextField
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.primaryBorderColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: AppColors.primaryBorderColor),
        ),
        filled: true,
        fillColor: AppColors.textFieldBackgroundColor,
        suffixIcon: Icon(
          icono,
          color: AppColors.textFieldIconColor,
        ),
      ),
      cursorColor: AppColors.cursorColor,
      style: const TextStyle(
        color: AppColors.textFieldTextColor,
        fontFamily: "Actor",
        fontSize: 18,
      ),
    );
  }
}
