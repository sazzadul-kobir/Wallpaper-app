import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/widgets/category_block.dart';
import 'package:wallpaper_app/view/widgets/custom_appbar.dart';
import 'package:wallpaper_app/view/widgets/search_bar.dart';

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

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Searchbar(),

            Container(
              margin: EdgeInsets.symmetric(
                vertical: 20
              ),
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                  itemBuilder:(context, index) {
                    return CategoryBlock();
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
