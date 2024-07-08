
import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  final String imgurl;
  const FullScreen({super.key, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Hero(
        tag: imgurl,
        child: Image.network(
        imgurl,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    )),
    );
  }
}
