import 'package:permission_handler/permission_handler.dart';

// Función para solicitar permisos
Future<void> requestStoragePermission() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}
