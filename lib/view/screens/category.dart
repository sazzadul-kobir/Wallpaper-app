import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/api_service.dart';
import 'package:wallpaper_app/model/apiDataModel.dart';
import 'package:wallpaper_app/view/screens/full_screen.dart';
import 'package:wallpaper_app/view/widgets/category_block.dart';
import 'package:wallpaper_app/view/widgets/custom_appbar.dart';
import 'package:wallpaper_app/view/widgets/search_bar.dart';

class CategoryScreen extends StatefulWidget {

  final String HeaderImgUrl;
  final String Searchword;

  const CategoryScreen({super.key, required this.HeaderImgUrl, required this.Searchword});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  ApiDataModel? apiDataModel;

  void get()async{
    try{
      apiDataModel=await ApiService().GetSearchWallpaper(widget.Searchword);
      setState(() {

      });
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
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

            Stack(
              children: [
                Image.network(
                  widget.HeaderImgUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 150,
                  color: Colors.black54,
                ),
                Positioned(
                  left: 140,
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
                      Text(widget.Searchword,
                         style: TextStyle(
                          fontSize: 40,
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
                itemCount: apiDataModel!.photos!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) {
                        return FullScreen(imgurl: apiDataModel!.photos![index].src!.portrait!);
                      }, ));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        apiDataModel!.photos![index].src!.portrait!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            )


          ],
        ),
      )
          :Center(child: CircularProgressIndicator(),),


    );
  }
}
