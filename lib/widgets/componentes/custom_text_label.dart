import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

class EtiquetaTextoBase extends StatelessWidget {
  final String etiqueta;

  const EtiquetaTextoBase({
    required this.etiqueta,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      etiqueta,
      style: const TextStyle(
        color: AppColors.primaryTextColor,
        fontFamily: "Actor",
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
