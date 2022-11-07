import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class VideoWidget extends StatelessWidget {
  final String Url;
  const VideoWidget({
    required this.Url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image(
            image: NetworkImage(Url),
            fit: BoxFit.cover,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return const Center(
                  child: Icon(
                Icons.wifi,
                color: Colors.white,
              ));
            },
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              radius: 25,
              child: IconButton(
                  iconSize: 22,
                  onPressed: () {},
                  icon: Icon(Icons.volume_off))),
        ),
      ],
    );
  }
}
