import 'package:flutter/material.dart';
import 'package:food_tech_app/screens/reservacion/pantalla_reserva.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/custom_seccion_encabezado.dart';

class PantallaDisponibilidad extends StatefulWidget {
  const PantallaDisponibilidad({super.key});

  @override
  State<PantallaDisponibilidad> createState() => _PantallaDisponibilidadState();
}

class _PantallaDisponibilidadState extends State<PantallaDisponibilidad> {
  String? selectedRestaurant;
  int selectedGuests = 1;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isAvailable = true;

  List<String> restaurants = [
    'Pupusería UTEC',
    'Cafetería San Salvador',
    'Restaurante UTEC',
    'Cafetería Gatunux'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      selectableDayPredicate: (DateTime date) {
        return date.isAfter(DateTime(now.year, 9, 19)) ||
            _isSameDate(date, now);
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final bool isToday = _isSameDate(selectedDate, DateTime.now());

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      if (isToday && (picked.hour < 15)) {
        _showTimeErrorDialog();
      } else {
        setState(() {
          selectedTime = picked;
        });
      }
    }
  }

  void _showTimeErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Hora inválida",
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: "Allerta",
              color: AppColors.naranja,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "No puedes seleccionar una hora antes de las 3:00 PM para hoy.",
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Actor",
              color: AppColors.negro,
            ),
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
              },
            ),
          ],
        );
      },
    );
  }

  void _checkAvailability() {
    setState(() {
      isAvailable = selectedGuests % 2 == 0;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReservationScreen()),
    );

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
                    color: AppColors.naranja,
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
              ? const Text(
                  "¡Hay disponibilidad en el horario seleccionado!",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Actor",
                    color: AppColors.naranja,
                    fontWeight: FontWeight.bold,
                  ),
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
              },
            ),
          ],
        );
      },
    );
  }

  final String titulo = "RESERVACIONES";
  final String logo = "assets/img/logo_reservacion.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SeccionEncabezado(
                tituloPantalla: titulo,
                rutaLogo: logo,
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Revisar disponibilidad aquí',
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: "Allerta",
                  color: AppColors.naranja,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Elige el restaurante de tu preferencia:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: AppColors.naranja),
                ),
                child: DropdownButton<String>(
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
                  items:
                      restaurants.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: "Actor",
                          color: AppColors.negro,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Número de invitados:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: AppColors.naranja),
                ),
                child: DropdownButton<int>(
                  value: selectedGuests,
                  isExpanded: true,
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
              const SizedBox(height: 16.0),
              const Text(
                'Fecha:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    color: AppColors.naranja,
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Hora:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.negro,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                  ),
                  IconButton(
                    icon: const Icon(Icons.access_time),
                    color: AppColors.naranja,
                    onPressed: () => _selectTime(context),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              Center(
                child: ElevatedButton(
                  onPressed: _checkAvailability,
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.naranja,
                    ),
                    elevation: WidgetStatePropertyAll(10.0),
                  ),
                  child: const Text(
                    "BUSCAR",
                    style: TextStyle(
                      color: AppColors.blanco,
                      fontFamily: "Actor",
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
