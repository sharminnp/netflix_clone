import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeSreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, bool value, Widget? _) {
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
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center(
                              child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ));
                        } else if (state.hasError) {
                          return const Center(
                              child: Text(
                            "Error While Getting data",
                            style: TextStyle(color: Colors.white),
                          ));
                        }

                        // _releasedPastYear.shuffle();
                        //pastyear
                        else {
                          final List<String> _releasedPastYear =
                              state.pastYearmovieList
                                  .map((m) {
                                    return '$imageAppendUrl${m.posterPath}';
                                  })
                                  .toList()
                                  .reversed
                                  .toList();

                          // final List<String> pastYear =
                          //     state.pastYearmovieList.map((m) {
                          //   return '$imageAppendUrl${m.posterPath}';
                          // }).toList();
                          // pastYear.shuffle();
                          //trending
                          final List<String> _trending =
                              state.trendingmovieList.map((m) {
                            return '$imageAppendUrl${m.posterPath}';
                          }).toList();
                          // final List<String> trending =
                          //     state.trendingmovieList.map((m) {
                          //   return '$imageAppendUrl${m.posterPath}';
                          // }).toList();
                          // trending.shuffle();
                          //tense dramas
                          final List<String> tenseDaramas =
                              state.tenseDramasmovieList
                                  .map((m) {
                                    return '$imageAppendUrl${m.posterPath}';
                                  })
                                  .toList()
                                  .reversed
                                  .toList();
                          //tenseDaramas.shuffle();
                          //southindian
                          final List<String> southIndian =
                              state.southindianmovieList.map((m) {
                            return '$imageAppendUrl${m.posterPath}';
                          }).toList();
                          final _top10TvShow = state.trendingTvList.map((t) {
                            return '$imageAppendUrl${t.posterPath}';
                          }).toList();
                          // _top10TvShow.shuffle();
                          // southIndian.shuffle();
                          log("shuffle build");
                          return ListView(
                            children: [
                              BagroundCard(),
                              kheight,
                              MainTitleCard(
                                title: 'Released in the Past Year',
                                posterList: _releasedPastYear,
                              ),
                              kheight,
                              MainTitleCard(
                                  title: "Trending Now", posterList: _trending),
                              kheight,
                              numberTileCard(
                                posterList: _top10TvShow,
                              ),
                              kheight,
                              MainTitleCard(
                                  title: "Tense Dramas",
                                  posterList: tenseDaramas),
                              kheight,
                              MainTitleCard(
                                  title: "South Indian cinema",
                                  posterList: southIndian),
                              kheight,
                            ],
                          );
                        }
                      },
                    ),
                    // (scrollNotifier.value == true)

                    value
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
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://i.pinimg.com/564x/0d/dc/ca/0ddccae723d85a703b798a5e682c23c1.jpg"),
                                              fit: BoxFit.contain)),
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
