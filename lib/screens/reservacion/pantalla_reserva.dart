import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

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
        const SnackBar(content: Text("¡POR FAVOR! Completar todos los campos")),
      );
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Introduce una dirección de correo válida")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("¡RESERVA REALIZADA CON EXITO!")),
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
      backgroundColor: const Color(0xFFF6F6F6),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  "HAZ TU RESERVA AQUÍ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField("NOMBRE", _nameController),
              const SizedBox(height: 10),
              _buildTextField("CORREO", _emailController),
              const SizedBox(height: 10),
              _buildTextField("TELÉFONO", _phoneController),
              const SizedBox(height: 20),
              _buildSectionTitle("SOLICITUDES ESPECIALES:"),
              _buildMultiLineTextField(_specialRequestsController,
                  "Ej: ¿Sería posible que nos asignen una mesa en una zona más tranquila del restaurante?."),
              const SizedBox(height: 20),
              _buildSectionTitle("COMENTARIOS:"),
              _buildMultiLineTextField(
                  _commentsController, "Ej: Excelente restaurante..."),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8B24),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Reservar",
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
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF8B24)),
        ),
        focusedBorder: const OutlineInputBorder(
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
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF8B24)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF8B24), width: 2.0),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
      ),
    );
  }
}
