import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:printing/printing.dart';

class PdfGenerator {
  //ini global, akan dipakai di beberapa tempat
  final pdf = pw.Document();

// khusus ngerjain buat pdf
  Future<void> buatPDF() async {
    print("membuat pdf baru");

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello Cuk"),
          ); // Center
        })); // Page
  }

  // khusus simpan dan buka
  Future<void> simpanLaluBukaPDF() async {
    buatPDF();
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    // final file = File("example.pdf");
    await file.writeAsBytes(await pdf.save());
    // return file.path;
    OpenFile.open(file.path);
  }

  // void cetakPDF() {
  //   Printing.layoutPdf(onLayout: )
  // }
}
