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
      body: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: size.height * 0.2,
              width: size.width * 0.45,
              margin: const EdgeInsets.only(top: 4, left: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                shape: BoxShape.rectangle,
                gradient: const LinearGradient(
                  colors: [Palette.darkGreen, Palette.lightGreen],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Column(
                      children: [
                        Text(
                          '29',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Palette.whiteColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'Inscrições',
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
                    ),
                  )
                ],
              ),
            ),
          ),
          4.ph,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Vagas recomendadas'),
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
                Text('Vagas disponíveis'),
                Text(
                  'Mais',
                  style: TextStyle(color: Palette.lightGreen),
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
                    height: 4,
                  );
                }),
          )
        ],
      ),
    );
  }
}
