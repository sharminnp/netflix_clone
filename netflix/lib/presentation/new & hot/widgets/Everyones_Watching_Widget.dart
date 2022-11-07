import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class Everyones_watching_widget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const Everyones_watching_widget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          movieName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          description,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
          style: TextStyle(color: kgreycolor),
        ),
        kheight50,
        VideoWidget(
          Url: posterPath,
        ),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 16,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 16,
            ),
            kWidth
          ],
        )
      ],
    );
  }
}
