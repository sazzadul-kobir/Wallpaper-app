import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/api_service.dart';
import 'package:wallpaper_app/model/apiDataModel.dart';
import 'package:wallpaper_app/view/screens/full_screen.dart';
import 'package:wallpaper_app/view/widgets/category_block.dart';
import 'package:wallpaper_app/view/widgets/custom_appbar.dart';
import 'package:wallpaper_app/view/widgets/search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiDataModel? dataModel;

  @override
  void initState() {
    super.initState();
    get();
  }

  void get() async {
    try {
      dataModel = await ApiService().FetchingTrendingWallpaper();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: CustomAppBar(
          word1: "Amazing",
          word2: " Wallpaper",
        ),
      ),
      body: dataModel != null
          ? CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Searchbar(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 50,
                    child: ListView.builder(
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: dataModel!.photos!.length,
                      itemBuilder: (context, index) {
                        return CategoryBlock();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid(

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,

              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 400,
            ),
            delegate: SliverChildBuilderDelegate(

                  (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return FullScreen(imgurl:dataModel!.photos![index].src!.portrait!);
                    },));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: dataModel!.photos![index].src!.portrait!,
                      child: Image.network(
                        dataModel!.photos![index].src!.portrait!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              childCount: dataModel!.photos!.length,
            ),
          ),
        ],
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

