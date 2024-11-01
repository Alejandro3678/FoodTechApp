import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("Usuarios");

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
  Future<void> updateUserData(String id, String nombres, String apellidos,
      String telefono) async {
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
