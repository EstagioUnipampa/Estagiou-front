import 'package:flutter/material.dart';

class RegistrationsView extends StatefulWidget {
  const RegistrationsView({super.key});

  @override
  State<RegistrationsView> createState() => _RegistrationsViewState();
}

class _RegistrationsViewState extends State<RegistrationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentos'),
      ),
      body: const Placeholder(),
    );
  }
}