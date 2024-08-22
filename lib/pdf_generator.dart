import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:printing/printing.dart';

class PdfGenerator {
// fungsi ini dipakai dibeberapa tempat
  void isiHalaman(pw.Document pdf) {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.roll80,
        build: (pw.Context context) {
          return pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text("Mobil Masya Allah",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 18)),
                ),
                pw.Center(
                  child: pw.Text("Masbagik - Lombok Timur",
                      style: pw.TextStyle(fontSize: 10)),
                ),
                pw.Center(
                  child: pw.Text("HP: 081 974 0000 8",
                      style: pw.TextStyle(fontSize: 10)),
                ),
                pw.SizedBox(height: 20),
                pw.Center(
                  child: pw.Text("Bukti Pembayaran Iuran Mobil",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 12)),
                ),
                pw.SizedBox(height: 20),
                pw.Text("ID Iuran: 01", style: pw.TextStyle(fontSize: 8)),
                pw.Text("Tanggal: 01 Agustus 2024",
                    style: pw.TextStyle(fontSize: 8)),
                pw.Text("Mode Pembayaran : Cash",
                    style: pw.TextStyle(fontSize: 8)),
                pw.Divider(),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Bulan",
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold)),
                      pw.Text("Tanggal",
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold)),
                      pw.Text("Nominal",
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold)),
                    ]),
                pw.Divider(),
                // contoh data
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Agustus 24", style: pw.TextStyle(fontSize: 10)),
                      pw.Text("14.8.24", style: pw.TextStyle(fontSize: 10)),
                      pw.Text("150.000", style: pw.TextStyle(fontSize: 10)),
                    ]),
                pw.SizedBox(height: 10),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Agustus 24", style: pw.TextStyle(fontSize: 10)),
                      pw.Text("14.8.24", style: pw.TextStyle(fontSize: 10)),
                      pw.Text("150.000", style: pw.TextStyle(fontSize: 10)),
                    ]),
                pw.SizedBox(height: 10),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Agustus 24", style: pw.TextStyle(fontSize: 10)),
                      pw.Text("14.8.24", style: pw.TextStyle(fontSize: 10)),
                      pw.Text("150.000", style: pw.TextStyle(fontSize: 10)),
                    ]),
                // end contoh data
                pw.SizedBox(height: 40),
                pw.Divider(),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text("Total",
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold)),
                      pw.Text("450000",
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold)),
                    ]),
                pw.Divider(),
                // tanda tangan
                pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text("Masbagik, 17 Agustus 1945",
                            style: pw.TextStyle(fontSize: 8)),
                        pw.Text("Admin,", style: pw.TextStyle(fontSize: 8)),
                        pw.SizedBox(height: 30),
                        pw.Text("Lilik Ahmadi",
                            style: pw.TextStyle(fontSize: 8)),
                      ]),
                ])
              ]); // Center
        }));
  }

//   // khusus simpan dan buka
  Future<void> simpanLaluBukaPDF() async {
    final pdf = pw.Document();
    isiHalaman(pdf);
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    // final file = File("example.pdf");
    await file.writeAsBytes(await pdf.save());
    // return file.path;
    OpenFile.open(file.path);
  }

  Future<void> cetakPDF() async {
    print("mencetak pdf");
    final pdf = pw.Document();
    isiHalaman(pdf);
    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }

  Future<void> sharePDF() async {
    final pdf = pw.Document();
    isiHalaman(pdf);
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'contoh.pdf');
  }
}
