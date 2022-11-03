import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/new%20&%20hot/widgets/Everyones_Watching_Widget.dart';

import 'package:netflix/presentation/widgets/video_widget.dart';

import '../home/widgets/custom_button_widget.dart';
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
                  color: Colors.blue,
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
        body: TabBarView(children: [
          _BuildComingSoon(),
          _BuildEveryonesWatching(),
        ]),
      ),
    );
  }
}

Widget _BuildComingSoon() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) => const Comingsoonwidget(),
  );
}

Widget _BuildEveryonesWatching() {
  return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Everyones_watching_widget());
}
