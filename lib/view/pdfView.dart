import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PdfView extends StatefulWidget {
  PdfView({Key key}) : super(key: key);
  // static final String routeName='haciaElPadrePage';

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView>  {
  bool _isLoading;
  PDFDocument doc;

@override
  void initState() {
    super.initState();
    _loadPdf();
  }
  _loadPdf() async{
    setState(() {
      _isLoading=true;
    });
    PDFDocument doc = await PDFDocument.fromAsset('assets/pdf/haciaelpadre.pdf');
    setState(() {
      doc=doc;
      _isLoading=false;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hacia el Padre'),
        ),
        body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(document: doc,
            indicatorBackground: Colors.red,
            showIndicator: false,
            showPicker: false,)
            ),
    );
  }
}