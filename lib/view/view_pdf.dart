// import 'dart:io';
//
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:path/path.dart';
//
// class PDFViewerPage extends StatefulWidget {
//   final File file;
//
//   const PDFViewerPage({
//     Key? key,
//     required this.file,
//   }) : super(key: key);
//
//   @override
//   _PDFViewerPageState createState() => _PDFViewerPageState();
// }
//
// class _PDFViewerPageState extends State<PDFViewerPage> {
//   PDFViewController? controller;
//   int pages = 0;
//   int indexPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final name = basename(widget.file.path);
//     final text = '${indexPage + 1} of $pages';
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         elevation: 0,
//         title: Text(name),
//         actions: pages >= 2
//             ? [
//                 Center(child: Text(text)),
//                 IconButton(
//                   icon: const Icon(Icons.chevron_left, size: 32),
//                   onPressed: () {
//                     final page = indexPage == 0 ? pages : indexPage - 1;
//                     controller!.setPage(page);
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.chevron_right, size: 32),
//                   onPressed: () {
//                     final page = indexPage == pages - 1 ? 0 : indexPage + 1;
//                     controller!.setPage(page);
//                   },
//                 ),
//               ]
//             : null,
//       ),
//       body: PDFView(
//         filePath: widget.file.path,
//         // autoSpacing: false,
//         // swipeHorizontal: true,
//         // pageSnap: false,
//         // pageFling: false,
//         onRender: (pages) => setState(() => this.pages = pages!),
//         onViewCreated: (controller) =>
//             setState(() => this.controller = controller),
//         onPageChanged: (indexPage, _) =>
//             setState(() => this.indexPage = indexPage!),
//       ),
//     );
//   }
// }

class ViewPDF extends StatefulWidget {
  final File file;
  const ViewPDF({Key? key, required this.file}) : super(key: key);

  @override
  _ViewPDFState createState() => _ViewPDFState();
}

class _ViewPDFState extends State<ViewPDF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: SfPdfViewer.file(widget.file),
    );
  }
}
