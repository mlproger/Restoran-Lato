import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  static const style =
      TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'NotoSans');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 28, 38, 1),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(r'assets/photos/bg.jpg'), fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height - 50,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(children: const [
                        Text(
                          'Этаж 41',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 182, 71, 1),
                              fontSize: 30),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('+7 812 937-41-41', style: style),
                        Text('пл. Конституции, 3/2', style: style),
                        Text('вс–чт 11:30–23:30', style: style),
                        Text('пт–сб 11:30–03:00', style: style),
                      ]),
                    ),
                    Container(
                      child: Column(children: const [
                        Text(
                          'Птиций двор',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 182, 71, 1),
                              fontSize: 30),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text('ул. Савушкина, 126', style: style),
                        Text('+7 812 934-20-20', style: style),
                        Text('ежедневно 11:00 – 23:00', style: style),
                      ]),
                    )
                  ]),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'WELL COMPANY',
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Well company — ресторанная группа, основанная в 2019 году ресторатом Санкт-Петербурга Сергеем Глазыриным, известного по таким заведениям как Meat Head, Этаж 41, Птичий двор, Paradise, «Жирная утка», «Виноград» и Macarena. Команду ресторана традиционно составили маститые профессионалы. Сейчас в группу входят 2 заведения и компания по производству и доставке рационов здорового питания.',
                      style: TextStyle(color: Colors.brown[300], fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Image.asset('assets/fourty-one-2-1200x600.jpg'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      'assets/fourty-one-sq.jpg',
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
