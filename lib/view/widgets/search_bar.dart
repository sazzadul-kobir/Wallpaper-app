import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screens/search.dart';

class Searchbar extends StatelessWidget {
   Searchbar ({super.key});

  final TextEditingController textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xf2a2626),
        border: Border.all(color: Color(0xb0b0b0b0)),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(

              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Search Wallpapers",
                errorBorder:InputBorder.none,
                focusedBorder:InputBorder.none,
                focusedErrorBorder:InputBorder.none,
                disabledBorder:InputBorder.none,
                enabledBorder:InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: (){
              textEditingController.text.isNotEmpty&& textEditingController.text!=''?Navigator.push(context, MaterialPageRoute(builder:  (context) {
                return SearchScreen(query: textEditingController.text);
              },)):null;
            },
            child: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
