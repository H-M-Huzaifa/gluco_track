import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

import 'constants/assets.dart';  // Import open_file package

Future<void> generatePdfReport(List<Map<String, dynamic>> entries, String timePeriod) async {
  final pdf = pw.Document();

  // Load the logo image from the assets
  final ByteData data = await rootBundle.load(Assets.logo);
  final imageLogo = pw.MemoryImage(data.buffer.asUint8List());
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          // Logo
          pw.Image(imageLogo, width: 100, height: 100),

          // Slogan
          pw.Text(
            "Your Diabetes, in check!",
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
              //color: PdfColor.fromHex('#2980B9'), // Use green for health-related content
            ),
          ),
          pw.SizedBox(height: 20),

          // Report Title
          pw.Text(
            "Medical Glucose Report",
            style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 10),

          // Time Period
          pw.Text("Time Period: $timePeriod", style: pw.TextStyle(fontSize: 14)),
          pw.SizedBox(height: 10),

          pw.Divider(),
          pw.SizedBox(height: 10),

          // Table of Entries
          pw.Table.fromTextArray(
            headers: ["Day", "Glucose", "Insulin", "Date & Time"],
            data: entries.map((entry) {
              return [
                entry['day'],
                entry['glucose'].toStringAsFixed(1),
                entry['insulin'],
                entry['timestamp']
              ];
            }).toList(),
          ),

          pw.SizedBox(height: 20),

          // Disclaimer Section
          pw.Text(
            "Disclaimer: This report is generated based on the data you provided and is for informational purposes only. Please consult your healthcare provider for professional advice.",
            style: pw.TextStyle(fontSize: 10, fontStyle: pw.FontStyle.italic),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            "This report is not a substitute for medical advice or diagnosis. GlucoTrack is not responsible for any health-related decisions made based on this data.",
            style: pw.TextStyle(fontSize: 10, fontStyle: pw.FontStyle.italic),
          ),
        ],
      ),
    ),
  );


  try {
    // Request storage permission
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Get the directory
      final output = await getExternalStorageDirectory();
      final directory = Directory("${output!.path}/Documents");

      // Ensure the directory exists
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }

      // Save the file
      final file = File("${directory.path}/glucose_report.pdf");
      await file.writeAsBytes(await pdf.save());
      print("PDF generated and saved to: ${file.path}");

      // Open the generated PDF file
      await OpenFile.open(file.path);
    } else {
      print("Storage permission not granted");
    }
  } catch (e) {
    print("Error saving PDF: $e");
  }
}
