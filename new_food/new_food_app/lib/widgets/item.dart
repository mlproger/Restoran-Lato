import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Item extends StatelessWidget {
  final String itemName;
  final String itemURL;
  const Item({Key? key, required this.itemName, required this.itemURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.height,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: const TextStyle(
                  color: Color.fromRGBO(9, 194, 250, 1),
                  fontSize: 40,
                  fontFamily: 'Bitter',
                  ),
            ),
          ]),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(itemURL), fit: BoxFit.cover)),
    );
  }
}
