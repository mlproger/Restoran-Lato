import 'package:flutter/material.dart';
import 'package:new_food_app/widgets/Home_screen.dart';
import 'package:new_food_app/widgets/menu_screen.dart';

void main() {
  runApp(const Home());
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

