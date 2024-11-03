import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_item.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/show_snackbar.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(BuildContext context, CartItem item) {
    if (containsItem(item)) {
      // Muestra el SnackBar si el producto ya está en el carrito
      showSnackBar(
        context,
        "${item.tituloComida} ya está añadido al carrito.",
        AppColors.rojo,
      );
      updateQuantity(item, item.cantidad + 1); // Incrementa la cantidad
    } else {
      _items.add(item);
      notifyListeners();
    }
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity <= 0) {
      removeItem(item);
    } else {
      item.cantidad = quantity;
      notifyListeners();
    }
  }

  double get total {
    return _items.fold(
        0.0, (sum, item) => sum + (item.precioComida * item.cantidad));
  }

  // Método para limpiar el carrito
  void clearCart() {
    _items.clear(); // Limpia la lista de productos
    notifyListeners(); // Notifica a los listeners para actualizar la interfaz
  }

  // Retorna el número de elementos en el carrito
  int get itemCount => _items.length;

  // Verifica si un producto ya está en el carrito
  bool containsItem(CartItem item) {
    return _items.any((cartItem) => cartItem.tituloComida == item.tituloComida);
  }
}
