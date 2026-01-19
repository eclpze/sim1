import 'package:flutter/material.dart';
import 'package:sumilyaqu/presentation/colors.dart' show desc, error, caption;
import 'package:sumilyaqu/presentation/custom_icon.dart';
import 'package:sumilyaqu/presentation/styles.dart';

import 'colors.dart' show desc;

// Губайдуллина Камилла, 19.01.2026, 14:53, текстовое поле для проекта

enum TextFieldType { text, password, data }

class CustomTextField extends StatefulWidget {
  final TextFieldType type; // Тип поля
  final bool isTitle; // Переменная для показа заголовка
  final String? title; // Заголовок
  final TextEditingController controller; // Контроллер
  final Color color; // Цвет поля
  final Color border; // Цвет границ
  final Color focus; // Цвет границ при фокусе
  final Color enable; // Цвет границ
  final double borderRadius; // Закругление
  final String hintText; // Текст поля
  final String error; // Текст при ошибке
  final double padding; // Отступы

  const CustomTextField({
    super.key,
    required this.type,
    required this.isTitle,
    this.title,
    required this.controller,
    required this.color,
    required this.border,
    required this.focus,
    required this.enable,
    required this.hintText,
    required this.error,
    required this.padding,
    required this.borderRadius,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  Widget build(BuildContext context) {
    bool hasError = widget.error.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: Column(
        children: [
          if (widget.isTitle)
            Row(
              children: [
                Text(widget.title!, style: textRegular.copyWith(color: desc)),
              ],
            ),
          if (widget.isTitle) SizedBox(height: 16),
          TextField(
            controller: widget.controller,
            obscureText: (widget.type == TextFieldType.password)
                ? obscureText
                : false,
            decoration: InputDecoration(
              suffixIcon: (widget.type == TextFieldType.password)
                  ? CustomIcon(
                      path: obscureText
                          ? 'assets/eye_off.svg'
                          : 'assets/eye_on.svg',
                      width: 20,
                      height: 20,
                      padding: 0,
                      onIcon: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: textRegular.copyWith(color: caption),
              filled: true,
              fillColor: widget.color,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(color: hasError ? error : widget.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(color: hasError ? error : widget.enable),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: BorderSide(color: hasError ? error : widget.focus),
              ),
            ),
          ),
          if (hasError) SizedBox(height: 10),
          if (hasError)
            Row(
              children: [
                Text(
                  widget.error!,
                  style: captionRegular.copyWith(color: error),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
