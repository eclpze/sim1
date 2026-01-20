import 'package:flutter/material.dart';
import 'package:sumilyaqu/presentation/colors.dart';
import 'package:sumilyaqu/presentation/styles.dart';

// Губайдуллина Камилла, 19.01.2026, 14:53, навигация для проекта
class CustomTabBar extends StatelessWidget {
  final List<String> icons; // Список иконок
  final List<String> title; // Список заголовков
  final Color color; // Цвет
  final int selectedIndex; // Выбранный раздел
  final ValueChanged onPressed; // Действие при нажатии

  const CustomTabBar({
    super.key,
    required this.icons,
    required this.title,
    required this.color,
    required this.selectedIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onPressed,
      backgroundColor: color,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: caption2Regular.copyWith(color: accent),
      unselectedLabelStyle: caption2Regular.copyWith(color: icon),
      unselectedItemColor: icon,
      selectedItemColor: accent,
      currentIndex: selectedIndex,
      items: List.generate(
        icons.length,
        (index) => BottomNavigationBarItem(
          icon: Image.asset(
            icons[index],
            width: 32,
            height: 32,
            color: selectedIndex == index ? accent : icon,
          ),
          label: title[index],
        ),
      ),
    );
  }
}
