import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservaciones',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF8B24),
      ),
      home: const ReservationScreen(),
    );
  }
}

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
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
      isAvailable = selectedGuests % 2 == 0;
    });

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nombre App",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        backgroundColor: const Color(0xFFFF8B24),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'RESERVACIONES',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF8B24)),
              ),
              const SizedBox(height: 8),
              const Text(
                'Revisar disponibilidad aquí',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              const Text('Elige el restaurante de tu preferencia:'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFF8B24)),
                ),
                child: DropdownButton<String>(
                  value: selectedRestaurant,
                  isExpanded: true,
                  hint: const Text('Selecciona un restaurante'),
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
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Número de invitados:'),
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
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Fecha:'),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFFF8B24)),
                      ),
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
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
              const Text('Hora:'),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFFF8B24)),
                      ),
                      child: Text(
                        selectedTime.format(context),
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
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: const Color(0xFFFF8B24),
                  ),
                  child: const Text(
                    "Buscar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFF8B24),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF000000),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: 2,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                label: "Ofertas",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: "Menú",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: "Reservas",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
            selectedItemColor: const Color(0xFFFFFFFF),
            unselectedItemColor: const Color(0xFF000000),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconSize: 30,
          ),
        ),
      ),
    );
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
