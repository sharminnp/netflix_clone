import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/main_title_card.dart';
import 'package:netflix/presentation/home/widgets/baground_card.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

import 'package:netflix/presentation/home/widgets/number_tile_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  print(direction);
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        BagroundCard(),
                        const MainTitleCard(
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
                    (scrollNotifier.value == true)
                        ? AnimatedContainer(
                            duration: Duration(microseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(0.3),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    kWidth,
                                    Container(
                                      color: Colors.blue,
                                      width: 30,
                                      height: 30,
                                    ),
                                    kWidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Tv Shows",
                                      style: KhomeTitleStyle,
                                    ),
                                    Text("Movies", style: KhomeTitleStyle),
                                    Text("Categories", style: KhomeTitleStyle)
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight
                  ],
                ),
              );
            }));
  }
}
