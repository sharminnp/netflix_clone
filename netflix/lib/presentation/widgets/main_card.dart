import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class Maincard extends StatelessWidget {
  const Maincard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 280,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: kradius10,
          color: Colors.red,
          image: const DecorationImage(
            image: NetworkImage(
                "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/q719jXXEzOoYaps6babgKnONONX.jpg"),
            fit: BoxFit.cover,
          )),
    );
  }
}
