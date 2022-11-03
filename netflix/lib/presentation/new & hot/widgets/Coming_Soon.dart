import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class Comingsoonwidget extends StatelessWidget {
  const Comingsoonwidget({
    Key? key,
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
                "FEB",
                style: TextStyle(fontSize: 15, color: kgreycolor),
              ),
              Text(
                "11",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
              VideoWidget(),
              Row(
                children: [
                  Text(
                    "TALL GIRL 2",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: "Remind me",
                        iconSize: 20,
                        textSize: 15,
                      ),
                      kWidth,
                      CustomButtonWidget(
                          icon: Icons.info,
                          title: "Info",
                          iconSize: 20,
                          textSize: 15),
                      kWidth
                    ],
                  )
                ],
              ),
              kheight,
              Text("Coming on Friday"),
              kheight,
              Text(
                "Tall Girl 2",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheight,
              Text(
                "Landing the lead in the school musical is dream come true for jodi,until the pressure sends her confidance-and her relationship-\nin to a tailspain",
                style: TextStyle(color: kgreycolor),
              )
            ],
          ),
        )
      ],
    );
  }
}
