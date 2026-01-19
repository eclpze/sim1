import 'package:flutter/material.dart';
import 'package:sumilyaqu/presentation/custom_icon.dart';

// Губайдуллина Камилла, 19.01.2026, 15:30, счетчик для проекта
class CustomCounter extends StatelessWidget {
  final Color color; // Цвет
  final double border; // Закругление
  final double padding; // Отступы
  final VoidCallback onPlus; // Действие при нажатии на плюс
  final VoidCallback onMinus; // Действие при нажатии на минус

  const CustomCounter({super.key, required this.color, required this.border, required this.padding, required this.onPlus, required this.onMinus});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(border)),
      ),
      child: Row(
        children: [
          CustomIcon(
            path: 'assets/minus.svg',
            width: 20,
            height: 20,
            padding: 0,
            onIcon: onMinus,
          ),
          SizedBox(width: 10,),
          CustomIcon(
            path: 'assets/plus.svg',
            width: 20,
            height: 20,
            padding: 0,
            onIcon: onPlus,
          ),
        ],
      ),
    );
  }
}
