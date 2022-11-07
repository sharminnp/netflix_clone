import 'package:flutter/material.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/title_widget.dart';

class numberTileCard extends StatelessWidget {
  const numberTileCard({Key? key, required this.posterList}) : super(key: key);
  final List<String> posterList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: "Top 10 Tv Shows in India Today",
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  posterList.length,
                  (index) => NumberCard(
                        imageUrl: posterList[index],
                        index: index,
                      ))),
        )
      ],
    );
  }
}
