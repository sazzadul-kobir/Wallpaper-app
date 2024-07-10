import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/api_service.dart';
import 'package:wallpaper_app/model/apiDataModel.dart';
import 'package:wallpaper_app/view/screens/category.dart';
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


  List<Map<String,dynamic>> CategoryListmap=[
    {"label":"Car","photo":"https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
    {"label":"Nature","photo":"https://images.pexels.com/photos/707344/pexels-photo-707344.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
    {"label":"True","photo":"https://images.pexels.com/photos/1250260/pexels-photo-1250260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
    {"label":"Road","photo":"https://images.pexels.com/photos/229014/pexels-photo-229014.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
    {"label":"Vintage","photo":"https://images.pexels.com/photos/247929/pexels-photo-247929.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
    {"label":"night","photo":"https://images.pexels.com/photos/631477/pexels-photo-631477.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},


  ];

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
                      itemCount: CategoryListmap.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return CategoryScreen(HeaderImgUrl: CategoryListmap[index]["photo"], Searchword: CategoryListmap[index]["label"]);
                            },));
                          },
                          child: CategoryBlock(
                            label: CategoryListmap[index]["label"],
                            imgUrl: CategoryListmap[index]["photo"],

                          ),
                        );
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

