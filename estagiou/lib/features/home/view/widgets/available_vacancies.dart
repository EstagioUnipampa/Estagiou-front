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
      decoration: const BoxDecoration(
        color: Palette.whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
                top: 2, left: 16), // Define o valor da margin-top
            child: Image.asset('assets/companyLogo.png', height: 55),
          ),
          18.pw,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Flexible(
                  child: Text('Nome da empresa', textAlign: TextAlign.center),
                ),
                const Flexible(
                  child: Text('Desenvolvimento de sistemas',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center),
                ),
                6.ph,
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/coins.png',
                        height: 24,
                        width: 24, // Tamanho do ícone
                      ),
                      10.pw,
                      const Text(
                        'R\$280,00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                2.ph,
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/work.png',
                        height: 24,
                        width: 24, // Tamanho do ícone
                      ),
                      10.pw,
                      const Text(
                        'São Paulo, Brasil',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
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
