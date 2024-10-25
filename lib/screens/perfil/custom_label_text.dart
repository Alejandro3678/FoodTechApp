import "package:flutter/material.dart";
import "package:food_tech_app/utils/colors.dart";

class CustomLabelText extends StatelessWidget {
  final String texto;
  final FontWeight? negrita;

  const CustomLabelText({
    super.key,
    required this.texto,
    this.negrita,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: 15.0,
        color: AppColors.blanco,
        fontFamily: "Actor",
        fontWeight: negrita,
      ),
    );
  }
}
