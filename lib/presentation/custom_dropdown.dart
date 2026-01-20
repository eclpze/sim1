import 'package:flutter/material.dart';
import 'package:sumilyaqu/presentation/colors.dart';
import 'package:sumilyaqu/presentation/styles.dart';

// Губайдуллина Камилла, 19.01.2026, 16:07, выпадающий список для проекта
class CustomDropDown extends StatefulWidget {
  final Color color; // Цвет
  final double borderRadius; // Закругление
  final String text; // Заголовок
  final List<String> items; // Элементы
  final double margin; //
  final double padding; //

  const CustomDropDown({
    super.key,
    required this.color,
    required this.borderRadius,
    required this.text,
    required this.items, required this.margin, required this.padding,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue; // Выбранное значение

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius))),
      child: DropdownButton(
        dropdownColor: widget.color,
        isExpanded: true,
        value: selectedValue,
        hint: Text(
          widget.text,
          style: headlineRegular.copyWith(color: caption),
        ),
        items: widget.items
            .map(
              (String item) => DropdownMenuItem(
                value: item,
                child: Text(item, style: headlineRegular),
              ),
            )
            .toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
      ),
    );
  }
}
