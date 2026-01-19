import 'package:flutter/material.dart';
import 'package:sumilyaqu/presentation/colors.dart';
import 'package:sumilyaqu/presentation/custom_button.dart';
import 'package:sumilyaqu/presentation/custom_counter.dart';
import 'package:sumilyaqu/presentation/custom_icon.dart';
import 'package:sumilyaqu/presentation/styles.dart';

// Губайдуллина Камилла, 19.01.2026, 16:22, карточка для проекта

enum CardType { primary, cart, project }

class CustomCard extends StatefulWidget {
  final CardType type; // Тип
  final String title; // Заголовок
  final double width; // Ширина заголовка
  final Color color; // Цвет карты
  final bool? inCart; // Переменная для типа primary
  final String text1; // Текст1
  final String? text2; // Текст2
  final String? text3; // Текст3
  final double border; // Закругление
  final double margin; // Отступы снаружи
  final VoidCallback onPressed; // Действие при нажатии

  const CustomCard({
    super.key,
    required this.title,
    required this.color,
    this.inCart,
    required this.text1,
    this.text2,
    this.text3,
    required this.border,
    required this.margin,
    required this.width,
    required this.type,
    required this.onPressed,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      margin: EdgeInsets.symmetric(horizontal: widget.margin),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(widget.border)),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.type == CardType.primary ||
                widget.type == CardType.project)
              SizedBox(
                width: widget.width,
                child: Text(widget.title, style: headlineMedium),
              ),
            if (widget.type == CardType.cart)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: widget.width,
                    child: Text(widget.title, style: headlineMedium),
                  ),
                  Spacer(),
                  CustomIcon(
                    path: 'assets/close.svg',
                    width: 20,
                    height: 20,
                    padding: 0,
                    onIcon: () {},
                  ),
                ],
              ),
            SizedBox(height: 16),
            if (widget.type == CardType.primary)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text1,
                        style: captionSemibold.copyWith(color: caption),
                      ),
                      SizedBox(height: 5),
                      Text(widget.text2!, style: title3Semibold),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    type: widget.inCart!
                        ? ButtonType.primary
                        : ButtonType.secondary,
                    color: widget.inCart! ? accent : white,
                    border: accent,
                    colorText: widget.inCart! ? white : accent,
                    text: widget.inCart! ? 'Добавить' : 'Убрать',
                    onPressed: widget.onPressed,
                    borderRadius: 10,
                    width: 130,
                    height: 40,
                  ),
                ],
              ),
            if (widget.type == CardType.cart)
              Row(
                children: [
                  Text(
                    widget.text1,
                    style: title3Semibold),
                  Spacer(),
                  Text(
                    widget.text2!,
                    style: textRegular,
                  ),
                  SizedBox(width: 10,),
                  CustomCounter(
                    color: input_bg,
                    border: 10,
                    padding: 10,
                    onPlus: () {},
                    onMinus: () {},
                  ),
                ],
              ),
            if (widget.type == CardType.project)
              Row(
                children: [
                  Text(
                    widget.text1,
                    style: captionSemibold.copyWith(color: caption),
                  ),
                  Spacer(),
                  CustomButton(
                    type: ButtonType.primary,
                    color: accent,
                    colorText: white,
                    text: 'Открыть',
                    onPressed: widget.onPressed,
                    borderRadius: 10,
                    width: 130,
                    height: 40,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
