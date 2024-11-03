import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_tech_app/firebase_services/auth_services.dart';
import 'package:food_tech_app/firebase_services/firestore_services.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_seccion_encabezado.dart';
import 'package:food_tech_app/widgets/show_snackbar.dart';

class PantallaDisponibilidad extends StatefulWidget {
  const PantallaDisponibilidad({super.key});

  @override
  State<PantallaDisponibilidad> createState() => _PantallaDisponibilidadState();
}

class _PantallaDisponibilidadState extends State<PantallaDisponibilidad> {
  //Para Encabezado de la Pantalla Reservaciones
  final String titulo = "RESERVACIONES";
  final String logo = "assets/img/logo_reservacion.png";

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? selectedRestaurant;
  int selectedGuests = 1;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SeccionEncabezado(
                tituloPantalla: titulo,
                rutaLogo: logo,
              ),
              SizedBox(height: 10.0),
              Text(
                "Revisa si hay disponibilidad",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Allerta",
                  color: AppColors.naranja,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Elige el restaurante de tu preferencia:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: AppColors.naranja),
                ),
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection("Sucursal").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator(
                        color: AppColors.naranja,
                      );
                    }
                    final restaurants = snapshot.data!.docs;
                    return DropdownButton<String>(
                      value: selectedRestaurant,
                      isExpanded: true,
                      hint: const Text(
                        'Selecciona un restaurante',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: "Actor",
                          color: AppColors.grisOscuro,
                        ),
                      ),
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedRestaurant = newValue;
                        });
                      },
                      items: restaurants.map((DocumentSnapshot doc) {
                        return DropdownMenuItem<String>(
                          value: doc["NombreSucursal"],
                          child: Text(doc["NombreSucursal"]),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Número de invitados:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: AppColors.naranja),
                ),
                child: DropdownButton<int>(
                  value: selectedGuests,
                  isExpanded: false,
                  underline: const SizedBox(),
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedGuests = newValue!;
                    });
                  },
                  items: List.generate(10, (index) => index + 1)
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        value.toString(),
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: "Actor",
                          color: AppColors.grisOscuro,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Fecha:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: AppColors.naranja),
                    ),
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Actor",
                        color: AppColors.grisOscuro,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    color: AppColors.naranja,
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text(
                'Hora:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: AppColors.naranja),
                    ),
                    child: Text(
                      selectedTime.format(context),
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontFamily: "Actor",
                        color: AppColors.grisOscuro,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.access_time),
                    color: AppColors.naranja,
                    onPressed: () => _selectTime(context),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () => _checkAvailability(),
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.naranja,
                  ),
                  elevation: WidgetStatePropertyAll(10.0),
                ),
                child: Text(
                  "Reservar",
                  style: TextStyle(
                    color: AppColors.blanco,
                    fontFamily: "Actor",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Funcion que retorna un booleano en el compara las fechas
  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  //Funcion que permite seleccionar la fecha de la reservacion
  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(now.year),
      lastDate: DateTime(2030),
      selectableDayPredicate: (DateTime date) {
        return date.isAfter(DateTime(now.year, 09, 30)) ||
            _isSameDate(date, now);
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  //Funcion que permite seleccionar la hora de la reservacion
  Future<void> _selectTime(BuildContext context) async {
    final bool isToday = _isSameDate(selectedDate, DateTime.now());

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      //Mientras la fecha elegida sea la misma que la fecha actual Y la fecha
      //elegida sea menor que las 3 de la tarde entonces
      //mostrara  una advertencia
      if (isToday && (picked.hour < 15)) {
        _showTimeErrorDialog();
      } else {
        setState(() {
          selectedTime = picked;
        });
      }
    }
  }

  //Dialog que enseña un mensaje de advertencia en caso que la hora elegida sea
  //menor que las 3 de la tarde y que la fecha elegida sea el mismo día
  void _showTimeErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Hora inválida",
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: "Actor",
              color: AppColors.negro,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "No puedes seleccionar una hora antes de las 3:00 PM para hoy.",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Actor",
              color: AppColors.negro,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "ACEPTAR",
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Actor",
                  color: AppColors.naranja,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Dialog que muestra una advertencia
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Advertencia",
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: "Actor",
              color: AppColors.negro,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.warning, color: AppColors.rojo, size: 50.0),
              Text(
                message,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Actor",
                  color: AppColors.negro,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "ACEPTAR",
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Actor",
                  color: AppColors.naranja,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Metodo que ayuda a verificar si esta todo en orden
  void _checkAvailability() {
    //Verifica que un restaurante ha sido seleccionado
    if (selectedRestaurant == null) {
      _showErrorDialog("Por favor, selecciona un restaurante.");
      return; // Detiene la ejecución si no se cumple la validación
    }

    //Verifica si la fecha y la hora son válidas
    if (selectedDate.isBefore(DateTime.now()) ||
        (selectedDate.isAtSameMomentAs(DateTime.now()) &&
            selectedTime.hour < 15)) {
      _showErrorDialog("La fecha y la hora seleccionadas no son válidas.");
      return; // Detiene la ejecución si no se cumple la validación
    }

    // Almacenar la reserva en Firestore
    String idUsuario = AuthServices().auth.currentUser!.uid;
    String sucursal = selectedRestaurant!;
    String comentario =
        "Reserva para $selectedGuests personas el ${selectedDate.toLocal()} a las ${selectedTime.format(context)}";

    FirestoreService().crearReserva(
      idUsuario,
      selectedGuests,
      sucursal,
      selectedDate,
      comentario,
      true,
    );
    setState(() {
      isAvailable = selectedGuests % 2 == 0;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: isAvailable
              ? const Text(
                  "Disponibilidad",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: "Actor",
                    color: AppColors.negro,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Text(
                  "No hay disponibilidad",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: "Actor",
                    color: AppColors.negro,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          content: isAvailable
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 50.0),
                    const Text(
                      "¡Hay disponibilidad en el horario seleccionado!. \n¿Deseas hacer la reservación?",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Actor",
                        color: AppColors.negro,
                      ),
                    ),
                  ],
                )
              : const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.warning, color: AppColors.rojo, size: 50.0),
                    SizedBox(height: 16.0),
                    Text(
                      "Desafortunadamente, no disponemos de mesas en el horario elegido. "
                      "Por favor, selecciona otro horario o restaurante.",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Actor",
                        color: AppColors.negro,
                      ),
                    ),
                  ],
                ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "ACEPTAR",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.naranja,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                showSnackBar(
                    context, "Tu reserva ha sido exitosa", Colors.green);
              },
            ),
            TextButton(
              child: const Text(
                "CANCELAR",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.naranja,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
