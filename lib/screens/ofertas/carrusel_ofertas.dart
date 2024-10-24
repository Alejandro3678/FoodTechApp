import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_card_dialog.dart';

//Lista de url de imagenes
final List<String> listaImagenOfertas = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
];

class CarruselOfertas extends StatefulWidget {
  const CarruselOfertas({super.key});

  @override
  State<CarruselOfertas> createState() => _CarruselOfertasState();
}

class _CarruselOfertasState extends State<CarruselOfertas> {
  int indiceActual = 0;
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
/*
Esta lista contiene los url de las imagenes en el cual con el metodo
map recorre cada item de la lista ListaImagenOfertas y donde cada item
se genera un SizedBox que va a contener cada imagen
*/
    final List<Widget> imageSliders = listaImagenOfertas
        .asMap()
        .entries
        .map(
          (entry) => GestureDetector(
            onTap: () {
              //Muestra el diálogo al presionar la imagen
              CustomCardDialog(
                imagenComida: entry.value, //URL de la imagen
                nombreComida:
                    'Comida ${entry.key + 1}', //Nombre de comida ejemplo
                descripcionComida:
                    'Descripción de comida ${entry.key + 1}', //Descripción ejemplo
                precioComida: 10.99, //Precio ejemplo
              ).dialogBuilder(context); //Llama al metodo dialogBuilder
            },
            child: SizedBox(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child:
                    Image.network(entry.value, fit: BoxFit.cover, width: 500.0),
              ),
            ),
          ),
        )
        .toList();

    return Column(
      children: [
        CarouselSlider(
          disableGesture: false,
          items: imageSliders,
          carouselController: controller,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            height: 400.0,
            onPageChanged: (index, reason) {
              setState(() {
                indiceActual = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listaImagenOfertas.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 7.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? AppColors.grisOscuro
                          : AppColors.naranja)
                      .withOpacity(indiceActual == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
