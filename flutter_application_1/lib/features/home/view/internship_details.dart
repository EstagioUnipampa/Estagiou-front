import 'package:flutter/material.dart';
import 'package:flutter_application_1/extensions/custom_padding.dart';
import 'package:flutter_application_1/features/home/view/home_profile.dart';
import 'package:flutter_application_1/theme/palette.dart';
import 'package:flutter_application_1/features/auth/view/components/custom_bottom_nav.dart';

class InternshipDetails extends StatefulWidget {
  const InternshipDetails({Key? key}) : super(key: key);

  @override
  State<InternshipDetails> createState() => _InternshipDetails();
}

class _InternshipDetails extends State<InternshipDetails> {
  int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     if (_selectedIndex == 2) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const HomeProfile()),
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Palette.lightGreen,
        title: Text('Detalhes'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Palette.whiteColor,
            ),
            
            onPressed: () {

            },
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
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                    Flexible(
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
          Divider(
              color: Palette.blueGrey,
              indent: 20, // Espaço à esquerda do divisor
              endIndent: 20, // Espaço à direita do divisor
            )
        ],
      ),
      // bottomNavigationBar: CustomBottomNav(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onItemTapped,
      // ),
    );
  }
}
