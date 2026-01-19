import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Губайдуллина Камилла, 19.01.2026, 14:36, иконка для проекта
class CustomIcon extends StatefulWidget {
  final String path; // Путь
  final double width; // Высота
  final double height; // Ширина
  final double padding; // Отступы
  final VoidCallback onIcon; // Действие при нажатие на иконку

  const CustomIcon({
    super.key,
    required this.path,
    required this.width,
    required this.height,
    required this.padding,
    required this.onIcon,
  });

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: IconButton(
        onPressed: widget.onIcon,
        icon: SvgPicture.asset(
          widget.path,
          width: widget.width,
          height: widget.height,
        ),
      ),
    );
  }
}
