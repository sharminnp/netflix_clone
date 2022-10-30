import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextWidget extends StatelessWidget {
  final String title;
  const SearchTextWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
