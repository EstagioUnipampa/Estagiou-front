import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/custom_padding.dart';
import 'package:flutter_application_1/features/registrations/view/components/job_vacancy.dart';
import 'package:flutter_application_1/theme/palette.dart';

class RegistrationsView extends StatefulWidget {
  const RegistrationsView({super.key});

  @override
  State<RegistrationsView> createState() => _RegistrationsViewState();
}

class _RegistrationsViewState extends State<RegistrationsView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 65,
        backgroundColor: Palette.lightGreen,
        title: const Text('Inscrições'),
      ),
      body: Column(children: [
        Flexible(
          child: ListView.separated(
              itemCount: 4,
              itemBuilder: (context, index) {
                return JobVacancyWidget(size: size);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 4,
                );
              }),
        )
      ],),
    );
  }
}

