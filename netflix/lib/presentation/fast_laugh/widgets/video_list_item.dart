import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class videoListItemInheritWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;
  const videoListItemInheritWidget(
      {super.key, required this.widget, required this.movieData})
      : super(
          child: widget,
        );
  @override
  bool updateShouldNotify(covariant videoListItemInheritWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static videoListItemInheritWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<videoListItemInheritWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterPath =
        videoListItemInheritWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyvideoUrl[index % dummyvideoUrl.length];
    return Stack(children: [
      // Container(
      //   color: Colors.accents[index % Colors.accents.length],
      // ),
      FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),
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
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$imageAppendUrl$posterPath'),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: likedVideoIdsNotifier,
                    builder: (BuildContext context, Set<int> newLikedListIds,
                        Widget? _) {
                      final _index = index;
                      if (newLikedListIds.contains(_index)) {
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(UnlikedVideo(id: _index));
                            likedVideoIdsNotifier.notifyListeners();
                            likedVideoIdsNotifier.value.remove(_index);
                          },
                          child: Videoactionawidget(
                              icon: Icons.favorite, title: "Favourite"),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          //
                          likedVideoIdsNotifier.notifyListeners();
                          likedVideoIdsNotifier.value.add(_index);
                        },
                        child: Videoactionawidget(
                            icon: Icons.emoji_emotions, title: "Lol"),
                      );
                    },
                  ),
                  Videoactionawidget(icon: Icons.add, title: "My List"),
                  GestureDetector(
                      onTap: () {
                        final movieName = videoListItemInheritWidget
                            .of(context)
                            ?.movieData
                            .posterPath;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: Videoactionawidget(
                          icon: Icons.share, title: "Share")),
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

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController))
            : Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
