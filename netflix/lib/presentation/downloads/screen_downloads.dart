import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final _widgetList = [_smartdownloads(), Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: AppbarWidget()),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  final List imagelist = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/fJSdqHzpMeCkXMrILYt1SdGN2sL.jpg",
    "https://www.themoviedb.org/t/p/w188_and_h282_bestv2/48DIQOSEgpoWUFBrmHW2En6aNZQ.jpg",
    "https://www.themoviedb.org/t/p/w188_and_h282_bestv2/sBp9UD2CdpkSo9E0uDTPUq4aelF.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          "Indroducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhitecolor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          "We will download a personalised selection of\nmovies and shows for you,so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kheight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: size.width * 0.4,
              ),
              downloadImageWidget(
                  margin: EdgeInsets.only(left: 170, bottom: 50),
                  imagelist: imagelist[0],
                  angle: 25,
                  size: Size(size.width * 0.35, size.width * 0.55)),
              downloadImageWidget(
                margin: EdgeInsets.only(right: 170, bottom: 50),
                imagelist: imagelist[1],
                angle: -25,
                size: Size(size.width * 0.35, size.width * 0.55),
              ),
              downloadImageWidget(
                margin: EdgeInsets.only(bottom: 0),
                imagelist: imagelist[2],
                radius: 10,
                size: Size(size.width * 0.4, size.width * 0.63),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtoncolorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: kWhitecolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: kButtoncolorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackcolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _smartdownloads extends StatelessWidget {
  const _smartdownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(Icons.settings, color: kWhitecolor),
        kWidth,
        Text(
          "Smart Downloads",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class downloadImageWidget extends StatelessWidget {
  const downloadImageWidget({
    Key? key,
    this.radius = 10,
    required this.size,
    this.angle = 0,
    required this.margin,
    required this.imagelist,
  }) : super(key: key);
  final EdgeInsets margin;
  final double angle;
  final String imagelist;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imagelist), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
