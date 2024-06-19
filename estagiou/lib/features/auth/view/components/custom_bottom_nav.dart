import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/palette.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  static const List<String> _routes = [
    '/home/homePage',
    '/home/documents',
    '/home/registrations',
    '/home/profile',
  ];

  @override
  void initState() {
    Modular.to.navigate(_routes[0]);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Modular.to.navigate(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Documentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_rounded),
            label: 'Inscrições',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Palette.lightGreen,
        unselectedItemColor: Palette.lightGreen.withOpacity(0.6),
        backgroundColor: Palette.whiteColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
