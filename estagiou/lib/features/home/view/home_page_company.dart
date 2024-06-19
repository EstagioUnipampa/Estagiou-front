import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/custom_padding.dart';
import 'package:flutter_application_1/theme/palette.dart';

class HomePageCompany extends StatefulWidget {
  const HomePageCompany({Key? key}) : super(key: key);

  @override
  State<HomePageCompany> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageCompany> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Palette.lightGreen,
        title: const Text('Bem-Vindo,'),
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
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: size.height * 0.2,
              width: size.width * 0.45,
              margin: const EdgeInsets.only(top: 15, left: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  shape: BoxShape.rectangle,
                  gradient: const LinearGradient(
                      colors: [Palette.darkGreen, Palette.lightGreen])),
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Column(
                      children: [
                        Text(
                          '10',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Palette.whiteColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Vagas',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Palette.whiteColor,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: -16,
                      right: -12,
                      child: Image.asset(
                        'assets/confirmed.png',
                        alignment: Alignment.bottomRight,
                      ))
                ],
              ),
            ),
          ),
          25.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Vagas Criadas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(2, (index) {
              return Container(
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Palette.whiteColor,
                    border: Border.all(width: 1, color: Palette.darkGreen),
                    boxShadow: const [
                      BoxShadow(color: Palette.darkGreen, offset: Offset(1, 1))
                    ]),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Palette.lightGreen,
                        ),
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                    8.pw,
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          4.ph,
                          Row(
                            children: [
                              const Icon(Icons.work),
                              4.pw,
                              const Text('Nome Empresa'),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.pin_drop,
                                color: Colors.red,
                              ),
                              4.pw,
                              const Text('Humaitá, Amazonas'),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.payment),
                              4.pw,
                              const Text('Pagamento em jacaré'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
      
    );
  }
}
