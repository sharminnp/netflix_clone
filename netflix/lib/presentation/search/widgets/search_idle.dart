import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/tSxbUnrnWlR5dQvUgqMI7sACmFD.jpg';

class SearchIdlewidget extends StatelessWidget {
  SearchIdlewidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextWidget(title: "Top Searches"),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => kheight20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 85,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageurl))),
        ),
        const Expanded(
            child: Text(
          "Movie Name",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        const CircleAvatar(
          backgroundColor: kWhitecolor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackcolor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhitecolor,
            ),
          ),
        )
      ],
    );
  }
}
