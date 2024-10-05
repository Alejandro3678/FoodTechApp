import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';
import 'package:food_tech_app/widgets/componentes/custom_seccion_encabezado.dart';

class PantallaDisponibilidad extends StatefulWidget {
  const PantallaDisponibilidad({super.key});

  @override
  _PantallaDisponibilidadState createState() => _PantallaDisponibilidadState();
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
          title: const Text("Hora inválida"),
          content: const Text(
              "No puedes seleccionar una hora antes de las 3:00 PM para hoy."),
          actions: <Widget>[
            TextButton(
              child: const Text("Aceptar"),
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
      //isAvailable = selectedGuests % 2 == 0;
    });
    Navigator.pushNamed(context, "/reserva");
    /*
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: isAvailable
              ? const Text("Disponibilidad")
              : const Text("No hay disponibilidad"),
          content: isAvailable
              ? const Text("¡Hay disponibilidad en el horario seleccionado!")
              : const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.warning, color: Colors.red, size: 50),
                    SizedBox(height: 16),
                    Text(
                        "Desafortunadamente, no disponemos de mesas en el horario elegido. "
                        "Por favor, selecciona otro horario o restaurante."),
                  ],
                ),
          actions: <Widget>[
            TextButton(
              child: const Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    */
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SeccionEncabezado(
                tituloPantalla: titulo,
                rutaLogo: logo,
              ),
              const SizedBox(height: 8),
              const Text(
                'Revisar disponibilidad aquí',
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: "Allerta",
                  color: AppColors.titleTextColor,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Elige el restaurante de tu preferencia:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Actor",
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryBorderColor),
                ),
                child: DropdownButton<String>(
                  value: selectedRestaurant,
                  isExpanded: true,
                  hint: const Text(
                    'Selecciona un restaurante',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: "Actor",
                      color: AppColors.subTitleTextColor,
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
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Número de invitados:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Actor",
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFF8B24)),
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
                          color: AppColors.subTitleTextColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Fecha:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "Actor",
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFFF8B24)),
                      ),
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: "Actor",
                          color: AppColors.subTitleTextColor,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Hora:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Actor",
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFFF8B24)),
                      ),
                      child: Text(
                        selectedTime.format(context),
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontFamily: "Actor",
                          color: AppColors.subTitleTextColor,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.access_time),
                    onPressed: () => _selectTime(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _checkAvailability,
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.buttonBackgroundColor,
                    ),
                    elevation: WidgetStatePropertyAll(10),
                  ),
                  child: const Text(
                    "BUSCAR",
                    style: TextStyle(
                      color: AppColors.buttonTextColor,
                      fontFamily: "Actor",
                      fontSize: 20.0,
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
