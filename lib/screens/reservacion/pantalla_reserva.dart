import 'package:flutter/material.dart';
import 'package:food_tech_app/utils/colors.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
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
        const SnackBar(
          content: Text(
            "¡POR FAVOR! Completar todos los campos",
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Actor",
              color: AppColors.blanco,
            ),
          ),
        ),
      );
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Introduce una dirección de correo válida",
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: "Actor",
              color: AppColors.blanco,
            ),
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Image.asset(
              "assets/img/icono_rico_app.png",
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            const Text(
              "¡RESERVA REALIZADA CON EXITO!",
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: "Actor",
                color: AppColors.blanco,
              ),
            ),
          ],
        ),
      ),
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
      appBar: AppBar(
        backgroundColor: AppColors.naranja,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.negro,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: const Drawer(),
      body: SafeArea(
        child: Padding(
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
                      fontFamily: "Allerta",
                      fontWeight: FontWeight.bold,
                      color: AppColors.naranja,
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
                      checkColor: AppColors.blanco,
                      activeColor: AppColors.naranja,
                      onChanged: (bool? value) {
                        setState(() {
                          _acceptsCommunication = value ?? false;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "CONSIENTO LA RECEPCIÓN DE COMUNICACIONES POR E-MAIL Y/O SMS",
                        style: TextStyle(color: AppColors.grisOscuro),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      elevation: 4.0,
                      backgroundColor: AppColors.naranja,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "RESERVAR",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Actor",
                        color: AppColors.blanco,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      cursorColor: AppColors.naranja,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: AppColors.grisOscuro,
          fontSize: 14.0,
          fontFamily: "Actor",
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.naranja),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.naranja, width: 2.0),
        ),
      ),
    );
  }

  Widget _buildMultiLineTextField(
      TextEditingController controller, String hintText) {
    return TextField(
      cursorColor: AppColors.naranja,
      controller: controller,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: "Actor",
          fontSize: 15.0,
          color: AppColors.grisOscuro,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.naranja),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.naranja, width: 2.0),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        fontFamily: "Allerta",
        color: AppColors.negro,
      ),
    );
  }

}