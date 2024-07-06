import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar ({super.key});

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
            child: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
