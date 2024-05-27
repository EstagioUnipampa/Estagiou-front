import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/palette.dart';

class CustomBottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomBottomNavItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isSelected ? Palette.lightGreen : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Palette.lightGreen,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Palette.lightGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
