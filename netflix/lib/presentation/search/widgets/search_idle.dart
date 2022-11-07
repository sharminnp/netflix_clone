import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return const Center(child: Text("Error while getting data"));
              } else if (state.idleList.isEmpty) {
                return Center(child: Text("List is empty"));
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                        imageurl: '$imageAppendUrl${movie.posterPath}',
                        title: movie.title ?? 'No title provided');
                  },
                  separatorBuilder: (ctx, index) => kheight20,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageurl;
  const TopSearchItemTile(
      {Key? key, required this.imageurl, required this.title})
      : super(key: key);

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
        SizedBox(
          width: 7,
        ),
        Expanded(
            child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        const CircleAvatar(
          backgroundColor: kWhitecolor,
          radius: 23,
          child: CircleAvatar(
            backgroundColor: kBlackcolor,
            radius: 21,
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
