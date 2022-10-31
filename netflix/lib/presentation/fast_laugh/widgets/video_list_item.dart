import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.accents[index % Colors.accents.length],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //rightside
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                      iconSize: 30,
                      onPressed: () {},
                      icon: Icon(Icons.volume_off))),
              //leftside
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://www.themoviedb.org/t/p/w188_and_h282_bestv2/sBp9UD2CdpkSo9E0uDTPUq4aelF.jpg"),
                    ),
                  ),
                  Videoactionawidget(icon: Icons.emoji_emotions, title: "Lol"),
                  Videoactionawidget(icon: Icons.add, title: "My List"),
                  Videoactionawidget(icon: Icons.share, title: "Share"),
                  Videoactionawidget(icon: Icons.play_arrow, title: "Play")
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}

class Videoactionawidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const Videoactionawidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(color: kWhitecolor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
