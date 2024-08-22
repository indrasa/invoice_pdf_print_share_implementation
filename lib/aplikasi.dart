import 'package:flutter/material.dart';
import 'package:invoice_pdf_print_share_implementation/pdf_page.dart';

class Aplikasi extends StatelessWidget {
  const Aplikasi({super.key});

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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfPage(),
                      ));
                },
                child: Text("Coba PDF"))
          ],
        ),
      ),
    );
  }
}
