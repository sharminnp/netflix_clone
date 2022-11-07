import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:netflix/core/constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
        Spacer(),
        Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kWidth,
        Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/564x/0d/dc/ca/0ddccae723d85a703b798a5e682c23c1.jpg"),
                    fit: BoxFit.contain))),
        kWidth,
      ],
    );
  }
}
