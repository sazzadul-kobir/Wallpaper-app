import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/api_service.dart';
import 'package:wallpaper_app/model/apiDataModel.dart';
import 'package:wallpaper_app/view/widgets/category_block.dart';
import 'package:wallpaper_app/view/widgets/custom_appbar.dart';
import 'package:wallpaper_app/view/widgets/search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   get();
  }
  void get()async{
    try{
      ApiDataModel dataModel=await  ApiService().FetchingTrendingWallpaper();
      print(dataModel.photos![1].src!.portrait);

    }catch(e){}

  }

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
