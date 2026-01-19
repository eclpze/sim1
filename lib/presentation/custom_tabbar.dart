import 'package:flutter/material.dart';
import 'package:sumilyaqu/presentation/colors.dart';

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
    required this.selectedIndex, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onPressed,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: input_bg,
      selectedItemColor: accent,
      currentIndex: selectedIndex,
      items: List.generate(
        icons.length,
        (context) => BottomNavigationBarItem(
          icon: Image.asset(icons[selectedIndex], width: 20, height: 20, color: ,),
          label: title[selectedIndex],
        ),
      ),
    );
  }
}
