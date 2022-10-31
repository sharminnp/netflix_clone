import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:netflix/core/colors/colors.dart';
import '../../../core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                height: 280,
                width: 30,
              ),
              Container(
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
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          bottom: -18,
          child: BorderedText(
            strokeWidth: 10,
            strokeColor: kWhitecolor,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                  fontSize: 130,
                  color: kBlackcolor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
