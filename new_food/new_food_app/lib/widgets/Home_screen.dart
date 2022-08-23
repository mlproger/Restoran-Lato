import 'package:flutter/material.dart';
import 'package:new_food_app/widgets/home_body.dart';
import 'package:new_food_app/widgets/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  static const List<Widget> _widgets = [MenuScreen(), HomeBody(), MenuScreen()];
  static const List<String> _widgetsAppBarNames = [
    'Меню',
    'Ресторан Lato',
    'Еещ чето'
  ];
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(backgroundColor: Color.fromRGBO(23, 28, 38, 1)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color.fromRGBO(255, 182, 71, 1),
            unselectedItemColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 21, 25, 35),
          )),
      home: Scaffold(
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.white, fontFamily: 'Cousine')),
              indicatorColor: const Color.fromRGBO(9, 194, 250, 1)),
          child: NavigationBar(
            animationDuration: const Duration(milliseconds: 500),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: const Color.fromARGB(255, 21, 25, 35),
            height: 60,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.restaurant_menu,
                    color: _selectedIndex == 0
                        ? const Color.fromRGBO(255, 182, 71, 1)
                        : Colors.white),
                label: 'Меню',
              ),
              NavigationDestination(
                icon: Icon(Icons.home,
                    color: _selectedIndex == 1
                        ? const Color.fromRGBO(255, 182, 71, 1)
                        : Colors.white),
                label: 'Главная',
              ),
              NavigationDestination(
                icon: Icon(Icons.table_bar,
                    color: _selectedIndex == 2
                        ? const Color.fromRGBO(255, 182, 71, 1)
                        : Colors.white),
                label: 'Забронировать',
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
          ),
        ),
        backgroundColor: const Color.fromRGBO(23, 28, 38, 1),
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              _widgetsAppBarNames[_selectedIndex],
              style: const TextStyle(
                  color: Color.fromRGBO(255, 182, 71, 1),
                  fontFamily: 'Montserrat',
                  fontSize: 35),
            )),
        body: _widgets[_selectedIndex],
      ),
    );
  }
}
