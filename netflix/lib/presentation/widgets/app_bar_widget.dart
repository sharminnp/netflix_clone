import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:netflix/core/constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          "Downloads",
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
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
        kWidth,
      ],
    );
  }
}
