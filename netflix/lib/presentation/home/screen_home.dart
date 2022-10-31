import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/main_title_card.dart';

import 'package:netflix/presentation/home/widgets/number_tile_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 650,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(KmainImage), fit: BoxFit.cover)),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.add,
                            size: 30,
                            color: kWhitecolor,
                          ),
                          Text(
                            "My List",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                      _PlayButton()
                    ],
                  ),
                )
              ],
            ),
            MainTitleCard(
              title: 'Released in the Past Year',
            ),
            kheight,
            MainTitleCard(title: "Trending Now"),
            kheight,
            numberTileCard(),
            kheight,
            MainTitleCard(title: "Tense Dramas"),
            kheight,
            MainTitleCard(title: "South Indian cinema"),
            kheight,
          ],
        ),
      ),
    ));
  }

  TextButton _PlayButton() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhitecolor)),
        onPressed: () {},
        icon: Icon(
          Icons.play_arrow,
          size: 30,
          color: kBlackcolor,
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20, color: kBlackcolor),
          ),
        ));
  }
}
