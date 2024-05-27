import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/palette.dart';
import 'custom_bottom_nav_item.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          CustomBottomNavItem(
            icon: Icons.home,
            label: 'Menu',
            isSelected: selectedIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          CustomBottomNavItem(
            icon: Icons.calendar_today,
            label: 'Documentos',
            isSelected: selectedIndex == 1,
            onTap: () => onItemTapped(1),
          ),
          CustomBottomNavItem(
            icon: Icons.person,
            label: 'Perfil',
            isSelected: selectedIndex == 2,
            onTap: () => onItemTapped(2),
          ),
        ],
      ),
    );
  }
}
