import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class Maincard extends StatelessWidget {
  String imageUrl;
  Maincard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 280,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: kradius10,
          color: Colors.red,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          )),
    );
  }
}
