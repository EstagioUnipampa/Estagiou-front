import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/custom_padding.dart';
import 'package:flutter_application_1/theme/palette.dart';

class InternshipDetails extends StatefulWidget {
  const InternshipDetails({Key? key}) : super(key: key);

  @override
  State<InternshipDetails> createState() => _InternshipDetails();
}

class _InternshipDetails extends State<InternshipDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Palette.lightGreen,
        title: const Text('Detalhes'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Palette.whiteColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          20.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120,
                  height: 10,
                  child: Container(
                    width: 20,
                    height: 2,
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(1, (index) {
              return Container(
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    8.pw,
                    const Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome Empresa',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Nome da Vaga',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 100), // Espaçamento adicional entre o texto e a imagem
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Palette.lightGreen,
                        ),
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          const Divider(
            color: Palette.blueGrey,
            indent: 20, // Espaço à esquerda do divisor
            endIndent: 20, // Espaço à direita do divisor
          ),
          // Adicionando as novas informações aqui
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(Icons.monetization_on, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Remuneração',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'R\$740,00/Mês',
                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: const Icon(Icons.location_on, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Localização',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'São Paulo, Brasil',
                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Palette.blueGrey,
            indent: 20, // Espaço à esquerda do divisor
            endIndent: 20, // Espaço à direita do divisor
          ),
          6.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Descrição do estágio',
                      style: TextStyle(
                        fontSize: 22, // Defina o tamanho da fonte desejado
                        fontWeight: FontWeight.bold, // Opcional: Defina o peso da fonte
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 10), // Espaçamento entre o título e a descrição
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    'Aqui está a descrição detalhada da vaga de estágio. '
                    'Inclua todas as informações relevantes sobre a vaga, como '
                    'responsabilidades, requisitos, local de trabalho, horário, '
                    'benefícios, etc.',
                    style: TextStyle(
                        fontSize: 16), // Defina o tamanho da fonte desejado
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
              child: const Icon(Icons.bookmark_border, color: Colors.green),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('INSCREVA-SE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
