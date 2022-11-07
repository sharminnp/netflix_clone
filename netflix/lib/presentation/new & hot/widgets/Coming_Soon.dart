import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class Comingsoonwidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  const Comingsoonwidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 430,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: TextStyle(fontSize: 15, color: kgreycolor),
              ),
              Text(
                day,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          height: 430,
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                Url: posterPath,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const CustomButtonWidget(
                    icon: Icons.notifications,
                    title: "Remind me",
                    iconSize: 20,
                    textSize: 15,
                  ),
                  kWidth,
                  const CustomButtonWidget(
                      icon: Icons.info,
                      title: "Info",
                      iconSize: 20,
                      textSize: 15),
                  kWidth
                ],
              ),
              kheight,
              Text("Coming on $day $month"),
              kheight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheight,
              Text(
                description,
                maxLines: 5,
                style: TextStyle(color: kgreycolor),
              )
            ],
          ),
        )
      ],
    );
  }
}
