import "package:flutter/material.dart";
import "package:food_tech_app/utils/colors.dart";
import "package:food_tech_app/widgets/custom_seccion_encabezado.dart";

class SeccionCuerpoCategoria extends StatelessWidget {
  final String titulo = "CATEGORIAS";
  final String logo = "assets/img/logo_categorias.png";

  const SeccionCuerpoCategoria({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 15.0,
            right: 15.0,
            bottom: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SeccionEncabezado(
                tituloPantalla: titulo,
                rutaLogo: logo,
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Selecciona la categoría que deseas ver",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  tarjetaCategoria(
                    "Entradas",
                    "https://i.pinimg.com/originals/90/af/77/90af7728cbb3e2a85c5d41911764d3a3.jpg",
                    () {
                      print("IR Entradas");
                    },
                  ),
                  tarjetaCategoria(
                    "Platos principales",
                    "https://th.bing.com/th/id/OIP.lSfL-rYjyklxqXOfO6FL1wHaE8?rs=1&pid=ImgDetMain",
                    () {
                      print("IR Platos principales");
                    },
                  ),
                  tarjetaCategoria(
                    "Postres",
                    "https://th.bing.com/th/id/OIP.HHGO4oFm2gV25Kxvj6nQGwHaFd?rs=1&pid=ImgDetMain",
                    () {
                      print("IR Postres");
                    },
                  ),
                  tarjetaCategoria(
                    "Bebidas",
                    "https://www.losvinos.com.ar/wp-content/uploads/2020/05/Bebidas-refrescantes-naturales-scaled.jpg",
                    () {
                      print("IR Bebidas");
                    },
                  ),
                  tarjetaCategoria(
                    "Sopas",
                    "https://th.bing.com/th/id/OIP.1xctuW-OG7tWZ7lbVfpOawHaG-?rs=1&pid=ImgDetMain",
                    () {
                      print("IR Sopas");
                    },
                  ),
                  tarjetaCategoria(
                    "Extras",
                    "https://th.bing.com/th/id/OIP.mMR4cyRGn_SRHPAtba8ppAHaE8?rs=1&pid=ImgDetMain",
                    () {
                      print("IR Extras");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tarjetaCategoria(
      String nombreCategoria, String imagenCategoria, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.network(
                imagenCategoria,
                width: double.infinity,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              nombreCategoria,
              style: const TextStyle(
                fontFamily: "Actor",
                color: AppColors.negro,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
