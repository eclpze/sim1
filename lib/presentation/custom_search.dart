import 'package:flutter/material.dart';
import 'package:sumilyaqu/presentation/colors.dart';
import 'package:sumilyaqu/presentation/custom_icon.dart';
import 'package:sumilyaqu/presentation/styles.dart';

// Губайдуллина Камилла, 19.01.2026, 14:31, поиск для проекта
class CustomSearch extends StatefulWidget {
  final String hintText; // Текст поля
  final TextEditingController controller; // Контроллер
  final Color color; // Цвет поля
  final Color border; // Границы
  final double borderRadius; // Закругление
  final Color colorCursor; // Цвет курсора
  final double padding; // Отступы

  const CustomSearch({
    super.key,
    required this.hintText,
    required this.color,
    required this.border,
    required this.colorCursor,
    required this.controller,
    required this.borderRadius, required this.padding,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: widget.padding),
      child: TextField(
        onChanged: (value) {
          setState(() {});
        },
        controller: widget.controller,
        cursorColor: widget.colorCursor,
        decoration: InputDecoration(
          fillColor: widget.color,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(color: widget.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(color: widget.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            borderSide: BorderSide(color: widget.border),
          ),
          hintText: widget.hintText,
          hintStyle: headlineRegular.copyWith(color: caption),
          prefixIcon: CustomIcon(
            path: 'assets/search.svg',
            width: 20,
            height: 20,
            padding: 0,
            onIcon: () {},
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? CustomIcon(
                  path: 'assets/close.svg',
                  width: 20,
                  height: 20,
                  padding: 0,
                  onIcon: () {
                    widget.controller.clear();
                  },
                )
              : null,
        ),
      ),
    );
  }
}
