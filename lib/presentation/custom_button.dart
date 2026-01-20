import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sumilyaqu/presentation/colors.dart';
import 'package:sumilyaqu/presentation/styles.dart';

//Губайдуллина Камилла, 19.01.2026, 15:30, кнопка для проекта
enum ButtonType { primary, inactive, secondary, tetriary, cart, login, chips }

class CustomButton extends StatefulWidget {
  final ButtonType type; // Тип
  final Color color; // Цвет
  final Color colorText; // Цвет текста
  final String text; // Текст
  final String? price; // Текст для типа кнопки cart
  final String? icon; // Путь к иконке
  final VoidCallback onPressed; // Действие при нажатии
  final Color? border; // Цвет границ
  final double borderRadius; // Закругление
  final double width; // Ширина
  final double height; // Высота
  final bool? isSelected; // Переменная для chips
  final double? padding; // Отступы

  const CustomButton({
    super.key,
    required this.type,
    required this.color,
    required this.colorText,
    required this.text,
    this.price,
    this.icon,
    required this.onPressed,
    this.border,
    required this.borderRadius,
    required this.width,
    required this.height,
    this.isSelected,
    this.padding,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == ButtonType.cart) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.padding!),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(widget.width, widget.height),
            backgroundColor: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(widget.icon!, height: 20, width: 20,),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                  style: title3Semibold.copyWith(color: widget.colorText),
                ),
              ),
            Spacer(),
              if (widget.price != null)
                Text(
                  widget.price!,
                  overflow: TextOverflow.ellipsis,
                  style: title3Semibold.copyWith(color: widget.colorText),
                ),
            ],
          ),
        ),
      );
    }
    if (widget.type == ButtonType.login) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.padding!),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(widget.width, widget.height),
            backgroundColor: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              side:  BorderSide(color: widget.border!)
            ),
          ),
          child: Row(
            children: [
              Spacer(),
              SvgPicture.asset(widget.icon!, height: 30, width: 30,),
              SizedBox(width: 16),
              Text(
                widget.text,
                overflow: TextOverflow.ellipsis,
                style: title3Semibold.copyWith(color: widget.colorText),
              ),
             Spacer(),

            ],
          ),
        ),
      );
    }
    if (widget.type == ButtonType.chips) {
      return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(widget.width, widget.height),
          fixedSize: Size(widget.width, widget.height),
          backgroundColor: widget.isSelected! ? widget.color : input_bg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
          ),
        ),
        child: Text(
          widget.text,
          overflow: TextOverflow.ellipsis,
          style: textMedium.copyWith(
            color: widget.isSelected! ? widget.colorText : desc,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(widget.width, widget.height),
          fixedSize: Size(widget.width, widget.height),
          backgroundColor: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.borderRadius),
            ),
            side: widget.type == ButtonType.secondary
                ? BorderSide(color: widget.border!)
                : BorderSide.none,
          ),
        ),
        child: Text(
          widget.text,
          overflow: TextOverflow.ellipsis,
          style: title3Semibold.copyWith(color: widget.colorText),
        ),
      );
    }
  }
}
