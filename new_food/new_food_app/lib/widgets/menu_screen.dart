import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:new_food_app/widgets/item.dart';
import 'package:web_scraper/web_scraper.dart' as scrapper;

import '../logic/hetch_http.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<String> _items_name = [];
  List<String> _items_img = [];
  Map<String, String> _items = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(23, 28, 38, 1),
        body: FutureBuilder(
            future: _getItem(),
            builder: (context, AsyncSnapshot snap) {
              if (!snap.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: Item(
                          itemName: _items_name[index],
                          itemURL: _items_img[index],
                        ));
                  },
                  itemCount: _items_name.length,
                );
              }
            }));
  }

  _getItem() async {
    _items_name = await _getItemName();
    _items_img = await _getItemScr();
    return _items;
  }

  _getItemName() async {
    var response =
        await fetch('https://wellcompany.group/delivery/') as Response;
    var chanel = parse(response.body);
    for (var name
        in chanel.getElementsByClassName('woocommerce-loop-category__title')) {
      _items_name.add(name.text
          .replaceAll(RegExp(r"/^\s+|\s+$|\s+(?=\s)/g"), '')
          .replaceAll(RegExp('[0-9]'), '')
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll('	', ''));
    }
    return _items_name;
  }

  _getItemScr() async {
    final page = scrapper.WebScraper('https://wellcompany.group');
    if (await page.loadWebPage('/delivery/')) {
      final List<Map<String, dynamic>> elements =
          page.getElement('li > a > img', ['src']);
      for (var item in elements) {
        _items_img.add(item['attributes']['src']
            .toString()
            .replaceAll('-300x300', '-800x800'));
      }
    }
    return _items_img;
  }
}
