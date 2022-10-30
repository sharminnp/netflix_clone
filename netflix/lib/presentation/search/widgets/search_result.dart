import 'package:flutter/cupertino.dart';

import 'package:netflix/core/constants.dart';

import 'package:netflix/presentation/search/widgets/title.dart';

const imagurl =
    "https://www.themoviedb.org/t/p/w188_and_h282_bestv2/48DIQOSEgpoWUFBrmHW2En6aNZQ.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextWidget(title: "Movies & Tv"),
        kheight,
        Expanded(
            child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.6,
          shrinkWrap: true,
          children: List.generate(20, (index) {
            return MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imagurl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
