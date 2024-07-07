import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/widgets/category_block.dart';
import 'package:wallpaper_app/view/widgets/custom_appbar.dart';
import 'package:wallpaper_app/view/widgets/search_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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

            Stack(
              children: [
                Image.network(
                    "https://images.pexels.com/photos/2533092/pexels-photo-2533092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 150,
                  color: Colors.black38,
                ),
                Positioned(
                  left: 120,
                  top: 40,
                  child: Column(
                    children: [
                      Text("Category",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                      ),
                      ),
                      Text("van",
                         style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      )
                      ),

                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Expanded(

              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 400

                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network("https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            )


          ],
        ),
      ),


    );
  }
}
