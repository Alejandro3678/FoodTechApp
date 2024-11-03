import 'dart:typed_data';
import 'package:food_tech_app/screens/funcionalidad_carrito/cart_item.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generatePdf(
  List<CartItem> items,
  double total,
  String userName,
  String userSurname,
) async {
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
    build: (pw.Context context) {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('Detalles de tu pedido',
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 10),
          pw.Text('Nombre: $userName $userSurname',
              style: pw.TextStyle(fontSize: 18)),
          pw.SizedBox(height: 20),
          pw.Table(
            border: pw.TableBorder.all(),
            columnWidths: {
              0: pw.FractionColumnWidth(0.4),
              1: pw.FractionColumnWidth(0.3),
              2: pw.FractionColumnWidth(0.3),
            },
            children: [
              pw.TableRow(children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Text('Producto', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Text('Precio', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(8.0),
                  child: pw.Text('Cantidad', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
              ]),
              for (var item in items)
                pw.TableRow(children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text(item.tituloComida),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text('\$${item.precioComida.toStringAsFixed(2)}'),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8.0),
                    child: pw.Text('${item.cantidad}'),
                  ),
                ]),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Text('Total: \$${total.toStringAsFixed(2)}',
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        ],
      );
    },
  ));

  return await pdf.save();
}
