import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String mensaje, Color colorFondo) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        mensaje,
        style: const TextStyle(
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      backgroundColor: colorFondo,
    ),
  );
}
