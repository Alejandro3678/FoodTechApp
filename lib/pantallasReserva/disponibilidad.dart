import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reservaciones',
      theme: ThemeData(
        primaryColor: Color(0xFFFF8B24),
      ),
      home: ReservationScreen(),
    );
  }
}

class ReservationScreen extends StatefulWidget {
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
          title: Text("Hora inválida"),
          content: Text(
              "No puedes seleccionar una hora antes de las 3:00 PM para hoy."),
          actions: <Widget>[
            TextButton(
              child: Text("Aceptar"),
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
              ? Text("Disponibilidad")
              : Text("No hay disponibilidad"),
          content: isAvailable
              ? Text("¡Hay disponibilidad en el horario seleccionado!")
              : Column(
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
              child: Text("Aceptar"),
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
        title: Text(
          "Nombre App",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        backgroundColor: Color(0xFFFF8B24),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RESERVACIONES',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF8B24)),
              ),
              SizedBox(height: 8),
              Text(
                'Revisar disponibilidad aquí',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text('Elige el restaurante de tu preferencia:'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFFF8B24)),
                ),
                child: DropdownButton<String>(
                  value: selectedRestaurant,
                  isExpanded: true,
                  hint: Text('Selecciona un restaurante'),
                  underline: SizedBox(),
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
              SizedBox(height: 16),
              Text('Número de invitados:'),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFFF8B24)),
                ),
                child: DropdownButton<int>(
                  value: selectedGuests,
                  isExpanded: true,
                  underline: SizedBox(),
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
              SizedBox(height: 16),
              Text('Fecha:'),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFFF8B24)),
                      ),
                      child: Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text('Hora:'),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFFF8B24)),
                      ),
                      child: Text(
                        "${selectedTime.format(context)}",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () => _selectTime(context),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _checkAvailability,
                  child: Text(
                    "Buscar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Color(0xFFFF8B24),
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
            color: Color(0xFFFF8B24),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF000000),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: 2,
            items: [
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
            selectedItemColor: Color(0xFFFFFFFF),
            unselectedItemColor: Color(0xFF000000),
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
