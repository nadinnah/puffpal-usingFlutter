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
    final double screenWidth = MediaQuery.of(context).size.width;

    final double horizontalPadding = screenWidth * 0.05;
    return Scaffold(
      backgroundColor: Color(0xffd8d6ea),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffd8d6ea),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
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
          SizedBox(width: horizontalPadding),

        ],
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: PdfViewPinch(
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
      ),
    );
  }
}
