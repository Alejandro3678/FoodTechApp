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
          color: AppColors.grisOscuro,
          fontFamily: "Actor",
          fontSize: 16.0,
        ),
        //Configuramos los bordes y color del TextField
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: AppColors.naranja),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: AppColors.naranja),
        ),
        filled: true,
        fillColor: AppColors.grisClaro,
        suffixIcon: Icon(
          icono,
          color: AppColors.naranja,
        ),
      ),
      cursorColor: AppColors.naranja,
      style: const TextStyle(
        color: AppColors.negro,
        fontFamily: "Actor",
        fontSize: 18.0,
      ),
    );
  }
}
