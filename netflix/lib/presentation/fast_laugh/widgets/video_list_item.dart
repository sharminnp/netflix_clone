import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.accents[index % Colors.accents.length],
    );
  }
}
