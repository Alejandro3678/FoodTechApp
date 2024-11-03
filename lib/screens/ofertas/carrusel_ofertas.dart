import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_tech_app/utils/colors.dart';

//Lista de url de imagenes
final List<String> listaImagenOfertas = [
  "https://firebasestorage.googleapis.com/v0/b/dbrickoapp.firebasestorage.app/o/imagenesOfertas%2FofertaPizza.png?alt=media&token=ec5fc87c-5a0d-41e6-8844-792bb887fd81",
  "https://firebasestorage.googleapis.com/v0/b/dbrickoapp.firebasestorage.app/o/imagenesOfertas%2FofertaTacos.png?alt=media&token=ca2d0248-80f1-4e74-9676-af132cab9854",
  "https://firebasestorage.googleapis.com/v0/b/dbrickoapp.firebasestorage.app/o/imagenesOfertas%2FofertasBebidas.png?alt=media&token=22e60995-a583-40fb-bf96-fead23eb1c30",
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
            child: SizedBox(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  entry.value,
                  fit: BoxFit.cover,
                  width: 500.0,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // La imagen se ha cargado, devuelve la imagen.
                    }
                    return Center( // Muestra el CircularProgressIndicator mientras carga.
                      child: CircularProgressIndicator(
                        color: AppColors.naranja,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return const Center(child: Icon(Icons.error)); // Icono de error si la carga falla.
                  },
                ),
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
