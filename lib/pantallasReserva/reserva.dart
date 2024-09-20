import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReservationScreen(),
    );
  }
}

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _specialRequestsController = TextEditingController();
  final _commentsController = TextEditingController();
  bool _acceptsCommunication = false;

  void _submitForm() {
    final email = _emailController.text;
    if (_nameController.text.isEmpty ||
        email.isEmpty ||
        _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("¡POR FAVOR! Completar todos los campos")),
      );
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Introduce una dirección de correo válida")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("¡RESERVA REALIZADA CON EXITO!")),
    );
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _specialRequestsController.clear();
    _commentsController.clear();
    setState(() {
      _acceptsCommunication = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
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
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
        backgroundColor: Color(0xFFFF8B24),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "HAZ TU RESERVA AQUÍ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField("NOMBRE", _nameController),
              SizedBox(height: 10),
              _buildTextField("CORREO", _emailController),
              SizedBox(height: 10),
              _buildTextField("TELÉFONO", _phoneController),
              SizedBox(height: 20),
              _buildSectionTitle("SOLICITUDES ESPECIALES:"),
              _buildMultiLineTextField(_specialRequestsController,
                  "Ej: ¿Sería posible que nos asignen una mesa en una zona más tranquila del restaurante?."),
              SizedBox(height: 20),
              _buildSectionTitle("COMENTARIOS:"),
              _buildMultiLineTextField(
                  _commentsController, "Ej: Excelente restaurante..."),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _acceptsCommunication,
                    onChanged: (bool? value) {
                      setState(() {
                        _acceptsCommunication = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "CONSIENTO LA RECEPCIÓN DE COMUNICACIONES POR E-MAIL Y/O SMS",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    "Reservar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF8B24),
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
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
            currentIndex: 3,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "Pedidos",
              ),
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

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF8B24)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF8B24), width: 2.0),
        ),
      ),
    );
  }

  Widget _buildMultiLineTextField(
      TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF8B24)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF8B24), width: 2.0),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
      ),
    );
  }
}
