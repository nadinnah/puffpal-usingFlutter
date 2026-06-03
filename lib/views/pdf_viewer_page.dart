import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({super.key});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  late PdfViewerController _pdfViewerController;

  final String assetPath = 'assets/pdf/asthma-action-plans.pdf';
  final String localFileName = 'user_asthma_plan.pdf';

  Uint8List? _pdfBytes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _loadPdfDocument();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    super.dispose();
  }

  // --- LOGIC: LOAD EDITED FILE OR FALLBACK TO ASSET ---
  Future<void> _loadPdfDocument() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final localFile = File('${directory.path}/$localFileName');

      if (await localFile.exists()) {
        // If the user previously edited and saved the document, load it
        final bytes = await localFile.readAsBytes();
        setState(() {
          _pdfBytes = bytes;
          _isLoading = false;
        });
      } else {
        // First-time setup: Load the clean baseline template from assets
        final byteData = await rootBundle.load(assetPath);
        setState(() {
          _pdfBytes = byteData.buffer.asUint8List();
          _isLoading = false;
        });
      }
    } catch (e) {
      _showSnackBar("Error loading PDF document: $e");
    }
  }

  // --- FEATURE: EXTRACT EDITED BYTES FROM VIEWER ---
  Future<Uint8List?> _getCurrentPdfBytes() async {
    // This extracts the live, modified bytes (with user text input) from the widget state
    final List<int> currentBytes = await _pdfViewerController.saveDocument();
    return Uint8List.fromList(currentBytes);
  }

  // --- FEATURE: PRINTING CURRENT EDITS ---
  Future<void> _printPdf() async {
    try {
      final editedBytes = await _getCurrentPdfBytes();
      if (editedBytes == null) return;

      await Printing.layoutPdf(
        onLayout: (format) async => editedBytes,
        name: 'asthma-action-plan',
      );
    } catch (e) {
      _showSnackBar("Error printing PDF: $e");
    }
  }

  // --- FEATURE: SAVING EDITS TO DEVICE ---
  Future<void> _savePdf({bool showFeedback = true}) async {
    try {
      final editedBytes = await _getCurrentPdfBytes();
      if (editedBytes == null) return;

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$localFileName');

      // Overwrite the local file with the newly modified bytes
      await file.writeAsBytes(editedBytes);

      if (showFeedback) {
        _showSnackBar("Progress saved successfully!");
      }
    } catch (e) {
      _showSnackBar("Failed to save progress: $e");
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.03;

    return WillPopScope(
      // Automatically save changes in the background when clicking back arrow or system back
      onWillPop: () async {
        await _savePdf(showFeedback: false);
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffd8d6ea),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffd8d6ea),
          leading: IconButton(
            onPressed: () async {
              await _savePdf(showFeedback: false);
              if (mounted) Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          title: const Text('Asthma Action Plan', style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              icon: const Icon(Icons.print, color: Colors.black),
              onPressed: _printPdf,
              tooltip: 'Print PDF',
            ),
            IconButton(
              icon: const Icon(Icons.save, color: Colors.black),
              onPressed: () => _savePdf(showFeedback: true),
              tooltip: 'Save PDF',
            ),
            SizedBox(width: horizontalPadding),
          ],
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SfPdfViewer.memory(
          _pdfBytes!,
          key: _pdfViewerKey,
          controller: _pdfViewerController,
          enableTextSelection: true,
        ),
      ),
    );
  }
}