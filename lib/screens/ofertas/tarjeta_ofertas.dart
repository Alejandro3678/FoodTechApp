import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_card_dialog.dart';

class TarjetaOfertas extends StatelessWidget {
  final String imagenPromocion;
  final String nombrePromocion;
  final String descripcionPromocion;
  final double precioPromocion;

  const TarjetaOfertas({
    required this.imagenPromocion,
    required this.nombrePromocion,
    required this.descripcionPromocion,
    required this.precioPromocion,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Image.network(
            imagenPromocion,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          nombrePromocion,
          style: const TextStyle(
            color: AppColors.negro,
            fontFamily: "Actor",
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "PRECIO: ",
              style: TextStyle(
                color: AppColors.grisOscuro,
                fontFamily: "Actor",
                fontSize: 12.0,
              ),
            ),
            Text(
              "\$$precioPromocion",
              style: const TextStyle(
                color: AppColors.naranja,
                fontFamily: "Allerta",
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                CustomCardDialog(
                  imagenComida: imagenPromocion,
                  nombreComida: nombrePromocion,
                  descripcionComida: descripcionPromocion,
                  precioComida: precioPromocion,
                ).dialogBuilder(context);
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.naranja),
                elevation: WidgetStatePropertyAll(4.0),
              ),
              child: const Text(
                "SELECCIONAR",
                style: TextStyle(
                  color: AppColors.blanco,
                  fontFamily: "Actor",
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 15.0)),
      ],
    );
  }
}
