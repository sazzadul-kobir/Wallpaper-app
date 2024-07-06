import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/widgets/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        centerTitle: true,
        title: CustomAppBar(
          word1: "Amazing",
          word2: " Wallpaper",
        ),
      ),
    );
  }
}
