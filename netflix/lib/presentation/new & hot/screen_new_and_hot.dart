import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hotAndNew/hot_and_new_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new%20&%20hot/widgets/Everyones_Watching_Widget.dart';

import 'widgets/Coming_Soon.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              title: Text(
                "Hot & New",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              actions: [
                Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://i.pinimg.com/564x/0d/dc/ca/0ddccae723d85a703b798a5e682c23c1.jpg"),
                          fit: BoxFit.contain)),
                  width: 30,
                  height: 30,
                ),
                kWidth,
              ],
              bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: kWhitecolor,
                  labelColor: kBlackcolor,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kWhitecolor, borderRadius: kradius30),
                  tabs: [
                    Tab(
                      text: "🍿 coming Soon",
                    ),
                    Tab(
                      text: "👀 Everyone's Watching",
                    )
                  ]),
            ),
            preferredSize: Size.fromHeight(90)),
        body: const TabBarView(children: [
          ComingSoonList(
            key: Key('coming_soon'),
          ),
          EveryOneIsWatchingList(
            key: Key('every_one_watching'),
          )
        ]),
      ),
    );
  }
}

Widget _BuildEveryonesWatching() {
  return ListView.builder(
      itemCount: 10, itemBuilder: (context, index) => SizedBox());
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child:
          BlocBuilder<HotAndNewBloc, HotAndNewState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.hasError) {
          return Center(child: Text("Error while getting data"));
        } else if (state.comingsoonList.isEmpty) {
          return Center(child: Text("Coming soon list empty"));
        } else {
          return ListView.builder(
              padding: EdgeInsets.only(top: 20),
              itemCount: state.comingsoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingsoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                log(movie.releaseDate.toString());
                String month = '';
                String date = '';
                // print(movie.releaseDate);
                // final _date = DateTime.parse(movie.releaseDate!);
                // final formattedDate = DateFormat.yMMMMd('en_US').format(_date);
                // print(formattedDate);
                try {
                  final _date = DateTime.tryParse(movie.releaseDate!);
                  final formttedDate =
                      DateFormat.yMMMMd('en_US').format(_date!);
                  month = formttedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  // date=movie.releaseDate.split('-')[1];
                  // date=movie.releaseDate!.split('-')[1];
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }

                return Comingsoonwidget(
                    id: movie.id.toString(),
                    // month: formattedDate.split('').first.substring(0, 3),
                    month: month,
                    day: date,
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No title',
                    description: movie.overview ?? 'No Description');
              });
        }
      }),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryoneIsWatching());
      },
      child:
          BlocBuilder<HotAndNewBloc, HotAndNewState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.hasError) {
          return Center(child: Text("Error while getting data"));
        } else if (state.everyOneIsWatchingList.isEmpty) {
          return Center(child: Text("Coming soon list empty"));
        } else {
          return ListView.builder(
              padding: EdgeInsets.all(13),
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (context, index) {
                final movie = state.everyOneIsWatchingList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }

                final tv = state.everyOneIsWatchingList[index];
                return Everyones_watching_widget(
                    posterPath: '$imageAppendUrl${tv.posterPath}',
                    movieName: tv.originalName ?? 'No Name provided',
                    description: tv.overview ?? 'no Description');
              });
        }
      }),
    );
  }
}
