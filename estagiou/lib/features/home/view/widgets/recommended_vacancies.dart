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
      width: 283,
      height: 200,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Palette.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03), // Cor #000000
            offset: const Offset(0, 8), // Somente Y com valor 8
            blurRadius: 2, // Valor de desfoque
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
                  borderRadius: BorderRadius.circular(20),
                  color: Palette.lightGreen),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20), // Aplica o border radius à imagem
                child: Image.asset(
                  'assets/companyLogo_recommended.png',
                  height: 80,
                  width: 80,
                  fit: BoxFit
                      .cover, // Faz a imagem preencher todo o espaço disponível
                ),
              ),
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
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          fontFamily: "Poppins"),
                    ),
                  ],
                ),
              ),
              const Flexible(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16.0), // Define a margem à esquerda
                      child: Text(
                        'Humaitá, Amazonas',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16.0), // Define a margem à esquerda
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/coins.png',
                            height: 16,
                            width: 16, // Tamanho do ícone
                          ),
                          4.pw, // Espaçamento horizontal entre o ícone e o texto
                          const Text(
                            'Não remunerado',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
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
