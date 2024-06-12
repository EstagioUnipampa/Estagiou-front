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
            icon: Icon(Icons.home, color: Palette.whiteColor),
            label: 'Menu',
            backgroundColor: Palette.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Documentos',
            backgroundColor: Palette.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_rounded),
            label: 'Inscrições',
            backgroundColor: Palette.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
            backgroundColor: Palette.lightGreen,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Palette.whiteColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
