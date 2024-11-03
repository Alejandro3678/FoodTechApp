import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_item.dart';

class FirestoreService {
  //Instancia para conectarnos a la coleccion Usuarios
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("Usuarios");

  //Instancia para conectarnos a la coleccion Categorias
  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection("Categorias");

  //Instancia para conectarnos a la coleccion Pedidos
  final CollectionReference _orderCollection =
      FirebaseFirestore.instance.collection("Pedidos");

  //Instancia para conectarnos a la coleccion Reservaciones
  final CollectionReference _reservationCollection =
      FirebaseFirestore.instance.collection("Reservaciones");

  //******************************PARA RESERVAS******************************
  // Método para agregar una nueva reserva
  Future<void> crearReserva(
      String idUsuario,
      int numeroInvitados,
      String sucursal,
      DateTime fechaReserva,
      String comentario,
      bool estadoReserva) async {
    try {
      await _reservationCollection.add({
        'IdUsuario': idUsuario,
        'NumeroInvitados': numeroInvitados,
        'Sucursal': sucursal,
        'FechaReserva': fechaReserva,
        'Comentario': comentario,
        'EstadoReserva': estadoReserva,
      });
    } catch (e) {
      "Error al crear la reserva: $e";
    }
  }

  //******************************PARA OFERTAS******************************
  // Método para leer todas las ofertas
  Stream<QuerySnapshot> readAllOffers() {
    return FirebaseFirestore.instance.collection('Ofertas').snapshots();
  }

  //******************************PARA PEDIDOS******************************
  // Método para crear un pedido en la colección Pedidos
  Future<void> createOrder({
    required String userId,
    required List<CartItem>
        products, // Asegúrate de que CartItem tenga los detalles necesarios
    required double total,
    required bool estado,
    required DateTime fechaPedido,
  }) async {
    // Crear una lista de mapas para los productos
    final productList = products.map((product) {
      return {
        "nombre": product.tituloComida,
        "descripcion": product.descripcionComida,
        "precio": product.precioComida,
        "cantidad": product.cantidad,
        "imagen": product.imagenComida,
      };
    }).toList();

    // Crear el documento en Firestore
    await _orderCollection.add({
      "IdUsuario": FirebaseFirestore.instance.doc("Usuarios/$userId"),
      "ListaProductos": productList,
      "Total": total,
      "Estado": estado,
      "FechaPedido": fechaPedido,
    });
  }

  //******************************PARA PRODUCTOS******************************
  //Para colocar los productos en las categorias correspondientes segun el idCategoria
  Stream<QuerySnapshot> readProductsByCategory(String idCategoria) {
    final categoryRef =
        FirebaseFirestore.instance.collection('Categorias').doc(idCategoria);
    return FirebaseFirestore.instance
        .collection('Productos')
        .where('IdCategoria', isEqualTo: categoryRef)
        .snapshots();
  }

  // Método para leer todos los productos
  Stream<QuerySnapshot> readAllProducts() {
    return FirebaseFirestore.instance
        .collection('Productos')
        .where('Disponible', isEqualTo: true) // Solo productos disponibles
        .snapshots();
  }

  //******************************PARA CATEGORIAS******************************
  //Metodo para leer datos de la coleccion Categorias
  Stream<QuerySnapshot> readCategoryData() {
    return _categoryCollection.snapshots();
  }

  //******************************PARA USUARIOS******************************
  //método para crear usuario en la coleccion usuarios
  Future<void> createUserData(String id, String nombres, String apellidos,
      String telefono, String correo) async {
    await _userCollection.doc(id).set({
      "Nombres": nombres,
      "Apellidos": apellidos,
      "Telefono": telefono,
      "Correo": correo,
    });
  }

  //método para leer datos de usuarios
  Stream<QuerySnapshot> readUserData() {
    return _userCollection.snapshots();
  }

  //método para actualizar datos de usuarios
  Future<void> updateUserData(
      String id, String nombres, String apellidos, String telefono) async {
    await _userCollection.doc(id).update({
      "Nombres": nombres,
      "Apellidos": apellidos,
      "Telefono": telefono,
    });
  }

  //método para eliminar datos de usuarios
  Future<void> deleteUserData(String id) async {
    await _userCollection.doc(id).delete();
  }

  //método para obtener datos de usuario
  Future<DocumentSnapshot> getUserData(String userId) async {
    return await _userCollection.doc(userId).get();
  }
}
