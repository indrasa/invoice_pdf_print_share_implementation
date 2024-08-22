import 'package:flutter/material.dart';
import 'package:invoice_pdf_print_share_implementation/pdf_generator.dart';
import 'package:open_file/open_file.dart';

class Aplikasi extends StatelessWidget {
  Aplikasi({super.key});
  PdfGenerator pdfGenerator = PdfGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implementasi Invoice PDF Print Share WA"),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  await pdfGenerator.simpanLaluBukaPDF();
                },
                child: Text("Simpan PDF"))
          ],
        ),
      ),
    );
  }
}
