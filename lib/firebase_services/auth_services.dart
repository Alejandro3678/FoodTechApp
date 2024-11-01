import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_tech_app/firebase_services/firestore_services.dart';

class AuthServices {
  //Creamos instancia para conectar con Firebase Authentication
  FirebaseAuth auth = FirebaseAuth.instance;
  //Creamos instancia para conectar con Firestore
  FirestoreService firestoreService = FirestoreService();

  // Método para crear cuenta de usuario con verificación de correo electrónico
  Future crearCuenta(String correo, String pass, String nombres, String apellidos,
      String telefono) async {
    try {
      // Crear cuenta
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: correo,
        password: pass,
      );

      //Obtenemos el ID del usuario
      String userId = userCredential.user!.uid;

      await firestoreService.createUserData(
          userId, nombres, apellidos, telefono, correo);

      // Enviar correo de verificación
      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return "Cuenta creada exitosamente. Por favor, verifica tu correo electrónico.";
      }
      return "Cuenta creada exitosamente";
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return "La contraseña es muy débil";
      } else if (e.code == "email-already-in-use") {
        return "Ese correo ya está en uso";
      }
    } catch (e) {
      return print("ERROR OCURRIDO, $e");
      
    }
  }

  // Método para logueo de usuario, verifica si el correo está confirmado
  Future inicioSesion(String correo, String pass) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: correo,
        password: pass,
      );

      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        return "Por favor, verifica tu correo electrónico antes de iniciar sesión.";
      }
      return "Bienvenido";
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "Usuario no encontrado con ese correo";
      } else if (e.code == "wrong-password") {
        return "La contraseña está equivocada";
      }
    } catch (e) {
      return "Error ocurrido";
    }
  }

  //Metodo de cambiar contraseña
  Future cambiarPassword(String correo) async {
    try {
      await auth.sendPasswordResetEmail(
        email: correo,
      );
      return "Se te ha enviado un mensaje a tu bandeja de correo";
    } catch (e) {
      return "Error ocurrido";
    }
  }

  //Metodo de cerrar sesion de usuario
  void cerrarSesionUsuario() {
    auth.signOut();
  }
}