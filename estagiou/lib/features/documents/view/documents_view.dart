import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/palette.dart';

class DocumentsView extends StatefulWidget {
  const DocumentsView({super.key});

  @override
  State<DocumentsView> createState() => _DocumentsViewState();
}

class _DocumentsViewState extends State<DocumentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentos'),
        toolbarHeight: 65,
        backgroundColor: Palette.lightGreen,
        
      ),
      body: Column(children: [
        
      ],),
    );
  }
}