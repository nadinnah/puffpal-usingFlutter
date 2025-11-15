import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({super.key});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  static const int initialPage = 1;
  late PdfControllerPinch pdfController;

  @override
  void initState() {
    super.initState();
    pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf/quizzes.pdf'),
      //make sure you add the pdf in asset
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: [
          IconButton(
            onPressed: () {
              pdfController.previousPage(
                duration: Duration(milliseconds: 100),
                curve: Curves.ease,
              );
            },
            icon: Icon(Icons.navigate_before),
          ),
          PdfPageNumber(
            controller: pdfController,
            builder: (_, loadingState, pageNumber, totalPages) => Container(
              alignment: Alignment.center,
              child: Text("$pageNumber/$totalPages"),
            ),
          ),
          IconButton(
            onPressed: () {
              pdfController.nextPage(
                duration: Duration(milliseconds: 100),
                curve: Curves.ease,
              );
            },
            icon: Icon(Icons.navigate_next),
          ),
          IconButton(
            onPressed: () => pdfController.loadDocument(
              PdfDocument.openAsset('assets/pdf/quizzes.pdf'),
            ),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: PdfViewPinch(
        controller: pdfController,
        scrollDirection: Axis.vertical,
        builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
          options: DefaultBuilderOptions(),
          documentLoaderBuilder: (_) =>
              Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) => Center(child: CircularProgressIndicator()),
          errorBuilder: (_, error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
