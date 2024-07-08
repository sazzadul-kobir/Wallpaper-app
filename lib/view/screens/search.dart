import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/api_service.dart';
import 'package:wallpaper_app/model/apiDataModel.dart';

import 'package:wallpaper_app/view/widgets/custom_appbar.dart';
import 'package:wallpaper_app/view/widgets/search_bar.dart';

import 'full_screen.dart';

class SearchScreen extends StatefulWidget {
final  String query;
  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  
  ApiDataModel? apiDataModel;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }
  
  void get() async{
    try{
      apiDataModel=await ApiService().GetSearchWallpaper(widget.query);
      setState(() {

      });
    }catch(e){
      print(e);
    }
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

      body:apiDataModel !=null? Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Searchbar(),
            SizedBox(
              height: 15,
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
                itemCount: apiDataModel!.photos!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return FullScreen(imgurl:apiDataModel!.photos![index].src!.portrait!);
                        },));
                      },

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(

                        tag: apiDataModel!.photos![index].src!.portrait!,
                        child: Image.network(apiDataModel!.photos![index].src!.portrait!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )


          ],
        ),
      ):Center(
        child: CircularProgressIndicator(),
      ),


    );
  }
}
