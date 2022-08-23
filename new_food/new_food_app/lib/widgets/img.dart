import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  const Img({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height / 4,);
  }
}