import 'package:flutter/material.dart';
import 'package:sumilyaqu/domain/globals.dart';
import 'package:sumilyaqu/presentation/colors.dart';
import 'package:sumilyaqu/presentation/custom_button.dart';
import 'package:sumilyaqu/presentation/custom_card.dart';
import 'package:sumilyaqu/presentation/custom_dropdown.dart';
import 'package:sumilyaqu/presentation/custom_search.dart';
import 'package:sumilyaqu/presentation/custom_tabbar.dart';
import 'package:sumilyaqu/presentation/custom_textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Test());
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String nameError = '';
  String passwordError = '';
  bool inCart = true;
  int selValue = 0;

  void validator() {
    setState(() {
      (nameController.text.isEmpty) ? nameError = 'упс ошибка' : nameError = '';
      (passwordController.text.isEmpty)
          ? passwordError = 'упс ошибка'
          : passwordError = '';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [Text(title[index]), SizedBox(width: 10)],
                    );
                  },
                  itemCount: title.length,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 60,
                      color: colors[index],
                    );
                  },
                  itemCount: colors.length,
                ),
              ),
              SizedBox(height: 10),
              CustomSearch(
                hintText: 'Искать описание',
                color: white,
                border: input_stroke,
                colorCursor: accent,
                controller: searchController,
                borderRadius: 10,
                padding: 10,
              ),
              // SizedBox(height: 10),
              // CustomDropDown(
              //   color: white,
              //   borderRadius: 10,
              //   text: 'Пол',
              //   items: ['Женский', 'Мужской'],
              //   selectedValue: '',
              // ),
              SizedBox(height: 10),
              CustomTextField(
                type: TextFieldType.text,
                isTitle: true,
                title: 'Имя',
                controller: nameController,
                color: white,
                border: input_stroke,
                focus: accent,
                enable: input_stroke,
                hintText: 'Введите имя',
                padding: 10,
                borderRadius: 10,
                error: nameError,
              ),
              SizedBox(height: 10),
              CustomTextField(
                type: TextFieldType.password,
                isTitle: false,
                controller: passwordController,
                color: white,
                border: input_stroke,
                focus: accent,
                enable: input_stroke,
                hintText: 'Введите пароль',
                padding: 10,
                borderRadius: 10,
                error: passwordError,
              ),
              SizedBox(height: 10),
              CustomButton(
                type: ButtonType.primary,
                color: accent,
                colorText: white,
                text: 'Отправить',
                onPressed: validator,
                borderRadius: 10,
                width: 335,
                height: 56,
              ),
              SizedBox(height: 10),
              CustomButton(
                type: ButtonType.inactive,
                color: accent_inactive,
                colorText: white,
                text: 'Отправить',
                onPressed: () {},
                borderRadius: 10,
                width: 335,
                height: 56,
              ),
              SizedBox(height: 10),
              CustomButton(
                type: ButtonType.secondary,
                color: white,
                colorText: accent,
                border: accent,
                text: 'Отправить',
                onPressed: () {},
                borderRadius: 10,
                width: 335,
                height: 56,
              ),
              SizedBox(height: 10),
              CustomButton(
                type: ButtonType.tetriary,
                color: input_bg,
                colorText: black,
                text: 'Отправить',
                onPressed: () {},
                borderRadius: 10,
                width: 335,
                height: 56,
              ),
              SizedBox(height: 10),
              CustomButton(
                padding: 40,
                type: ButtonType.cart,
                color: accent,
                colorText: white,
                icon: 'assets/cart.svg',
                price: '500 ₽',
                text: 'Отправить',
                onPressed: () {},
                borderRadius: 10,
                width: 335,
                height: 56,
              ),
              SizedBox(height: 10),
              CustomButton(
                padding: 40,
                type: ButtonType.login,
                color: white,
                border: input_stroke,
                colorText: black,
                icon: 'assets/vk.svg',
                text: 'Войти с VK',
                onPressed: () {},
                borderRadius: 10,
                width: 335,
                height: 56,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    CustomButton(
                      type: ButtonType.chips,
                      isSelected: true,
                      color: accent,
                      colorText: white,
                      text: 'Популярные',
                      onPressed: () {},
                      borderRadius: 10,
                      width: 140,
                      height: 50,
                    ),
                    Spacer(),
                    CustomButton(
                      type: ButtonType.chips,
                      isSelected: false,
                      color: accent,
                      colorText: white,
                      text: 'Популярные',
                      onPressed: () {},
                      borderRadius: 10,
                      width: 140,
                      height: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              CustomCard(
                title: 'Рубашка Воскресенье для машинного вязания',
                color: Colors.white,
                text1: 'Мужская одежда',
                text2: '300 ₽',
                border: 10,
                margin: 15,
                width: 300,
                type: CardType.primary,
                inCart: inCart,
                onPressed: () {
                  setState(() {
                    inCart = !inCart;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomCard(
                title: 'Рубашка Воскресенье для машинного вязания',
                color: Colors.white,
                text1: '300 ₽',
                text2: '1 штук',
                border: 10,
                margin: 15,
                width: 275,
                type: CardType.cart,
                onPressed: () {},
              ),
              SizedBox(height: 20),
              CustomCard(
                title: 'Мой первый проект',
                color: Colors.white,
                text1: 'Прошло 2 дня',
                border: 10,
                margin: 15,
                width: 300,
                type: CardType.project,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomTabBar(
        icons: ['assets/map.png', 'assets/map.png'],
        title: ['asasasa', 'assets/home.svg'],
        color: white,
        selectedIndex: selValue,
        onPressed: (index) {
          setState(() {
            selValue = index;
          });

        },
      ),
    );
  }
}
