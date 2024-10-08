import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/custom_padding.dart';
import 'package:flutter_application_1/features/home/view/widgets/available_vacancies.dart';
import 'package:flutter_application_1/features/home/view/widgets/recommended_vacancies.dart';
import 'package:flutter_application_1/theme/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: Palette.backgroundColor,
      body: ListView(
        children: [
          20.ph,
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 90,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 4, left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: const Color(0xFF1A7924),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 8,
                    left: 32,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Alinha o texto à esquerda
                      children: [
                        Text(
                          '29',
                          style: TextStyle(
                            color: Palette.whiteColor,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Inscrições',
                          style: TextStyle(
                              color: Palette.whiteColor, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 21,
                    right: 12,
                    child: Image.asset(
                      'assets/confirmed.png',
                      height: 50,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          20.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Vagas recomendadas',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                SizedBox(
                  width: 120,
                  height: 10,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return 4.pw;
                    },
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 20,
                        height: 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Palette.darkGreen,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: size.height * 0.125,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return 4.pw;
              },
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return RecommendedVacanciesWidget(size: size);
              },
            ),
          ),
          12.ph,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vagas disponíveis',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text(
                  'Mais',
                  style: TextStyle(color: Palette.lightGreen, fontSize: 14),
                ),
              ],
            ),
          ),
          12.ph,
          SizedBox(
            height: size.height * 0.35,
            child: ListView.separated(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AvailableVacanciesWidget(size: size);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 16,
                  );
                }),
          )
        ],
      ),
    );
  }
}
