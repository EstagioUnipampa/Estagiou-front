
import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/custom_padding.dart';
import 'package:flutter_application_1/theme/palette.dart';

class RecommendedVacanciesWidget extends StatelessWidget {
  const RecommendedVacanciesWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      height: size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Palette.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: Palette.darkGreen,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Palette.lightGreen,
              ),
              child: Image.asset('assets/companyLogo_recommended.png'),
            ),
          ),
          8.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              4.ph,
              const Flexible(
                child: Row(
                  children: [
                    Text(
                      'Engenharia de Software',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Flexible(
                child: Row(
                  children: [
                    Text('Humaitá, Amazonas'),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    const Icon(Icons.money),
                    4.pw,
                    const Text(
                      'Não remunerado',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
