import 'package:flutter/material.dart';
import 'package:sumilyaqu/presentation/colors.dart';
import 'package:sumilyaqu/presentation/styles.dart';

// Губайдуллина Камилла, 19.01.2026, 16:07, выпадающий список для проекта
class CustomDropDown extends StatefulWidget {
  final Color color; // Цвет
  final double borderRadius; // Закругление
  final String text; // Заголовок
  final List<String> items; // Элементы
  final String? selectedValue; // Выбранное значение

  const CustomDropDown({
    super.key,
    required this.color,
    required this.borderRadius,
    required this.text,
    required this.items,
   this.selectedValue,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: DropdownButton(
        value: widget.selectedValue,
        hint: Text(
          widget.text,
          style: headlineRegular.copyWith(color: caption),
        ),
        items: widget.items
            .map(
              (item) =>
                  DropdownMenuItem(child: Text(item, style: headlineRegular)),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            value = widget.selectedValue;
          });
        },
      ),
    );
  }
}
