import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:netflix/core/colors/colors.dart';
import '../../../core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;
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
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          bottom: -13,
          child: BorderedText(
            strokeWidth: 10,
            strokeColor: kWhitecolor,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                  fontSize: 120,
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
