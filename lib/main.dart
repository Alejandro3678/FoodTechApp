import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_options.dart';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_provider.dart';
import 'package:food_tech_app/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: RicoApp(),
    ),
  );
}

class RicoApp extends StatefulWidget {
  const RicoApp({super.key});

  @override
  State<RicoApp> createState() => _RicoAppState();
}

class _RicoAppState extends State<RicoApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  /*
  final rutaPantallas = {
    "/": (context) => const SplashScreen(),
    "/inicioSesion": (context) => const PantallaInicioSesion(),
    "/registro": (context) => const PantallaRegistro(),
    "/ofertas": (context) => const SplashScreen(),
    "/perfil": (context) => const PantallaPerfil(),
    "/menu": (context) => const PantallaMenuDia(),
    "/disponibilidad": (context) => const PantallaDisponibilidad(),
    "/reserva": (context) => const ReservationScreen(),
    "/pedidos": (context) => const PantallaPedidos(),
    "/principal": (context) => const MainApp(),
  };
  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RicoApp",
      //initialRoute: "/",
      //routes: rutaPantallas,
      home: FutureBuilder(
        //Inicializa FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          //Verifica si hay errores al momento de iniciar FlutterFire
          if (snapshot.hasError) {
            return Container();
          }

          //Si la inicializacion es exitosa se muestra el Splash
          if (snapshot.connectionState == ConnectionState.done) {
            return const SplashScreen();
          }

          //Mientas se Firebase se inicializa muestra un circularProgressIndicator
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
