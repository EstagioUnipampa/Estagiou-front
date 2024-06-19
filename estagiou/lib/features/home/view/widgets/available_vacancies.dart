
import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/custom_padding.dart';
import 'package:flutter_application_1/theme/palette.dart';

class AvailableVacanciesWidget extends StatelessWidget {
  const AvailableVacanciesWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      height: size.height * 0.15,
      width: size.width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Palette.whiteColor,
        border: Border.all(width: 1, color: Palette.darkGreen),
        boxShadow: const [
          BoxShadow(
            color: Palette.darkGreen,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Palette.lightGreen,
            ),
            child: Image.asset('assets/logo.png',
                height: size.height * 0.1),
          ),
          8.pw,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Flexible(
                  child: Text('Nome da empresa',
                      textAlign: TextAlign.center),
                ),
                const Flexible(
                  child: Text('Desenvolvimento de sistemas',
                      style:
                          TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Palette.lightGreen,
                      ),
                      4.pw,
                      const Text(
                        'R\$280,00',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.work,
                          color: Palette.lightGreen),
                      4.pw,
                      const Text('São Paulo, Brasil',
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
