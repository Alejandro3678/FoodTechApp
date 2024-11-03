class CartItem {
  final String imagenComida;
  final String tituloComida;
  final String descripcionComida;
  final String? validezComida;
  final double precioComida;
  int cantidad;

  CartItem({
    required this.imagenComida,
    required this.tituloComida,
    required this.descripcionComida,
    this.validezComida,
    required this.precioComida,
    this.cantidad = 1,
  });
}
