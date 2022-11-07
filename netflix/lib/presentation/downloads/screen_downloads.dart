import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final _widgetList = [const _smartdownloads(), Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppbarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadImage());
    });

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Indroducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhitecolor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kheight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you,so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        kheight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          radius: size.width * 0.4,
                        ),
                        downloadImageWidget(
                            margin:
                                const EdgeInsets.only(left: 170, bottom: 50),
                            imagelist:
                                '$imageAppendUrl${state.downloads[0].posterPath}',
                            angle: 25,
                            size: Size(size.width * 0.35, size.width * 0.55)),
                        downloadImageWidget(
                          margin: const EdgeInsets.only(right: 170, bottom: 50),
                          imagelist:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          angle: -25,
                          size: Size(size.width * 0.35, size.width * 0.55),
                        ),
                        downloadImageWidget(
                          margin: const EdgeInsets.only(bottom: 0),
                          imagelist:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          radius: 10,
                          size: Size(size.width * 0.4, size.width * 0.63),
                        ),
                      ],
                    ),
            );
          },
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
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
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
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
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
                  image: NetworkImage(
                    imagelist.isEmpty ? KmainImage : imagelist,
                  ),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
