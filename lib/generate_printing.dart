import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class GeneratePrinting {
  Future<void> PrintingPdf(String name, String cpf) async {
    final pdf = pw.Document();

    final netImage = await networkImage('https://www.nfet.net/nfet.jpg');

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                pw.Container(
                    width: 100,
                    height: 300,
                    child: pw.Image(netImage, fit: pw.BoxFit.cover)),
                pw.Text('O nome completo é: ${name}'),
                pw.Text('O nome completo é: ${cpf}'),
              ])); // Center
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
