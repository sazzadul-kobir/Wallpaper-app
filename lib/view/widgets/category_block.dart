
import 'package:flutter/material.dart';

class CategoryBlock extends StatelessWidget {

  final String imgUrl;
  final String label;

  const CategoryBlock({super.key, required this.imgUrl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 7
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imgUrl,

              height: 50,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12)
            ),
          ),

          Positioned(
            left: 30,
            top: 15,
            child: Text(label,style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
            ),
          )

        ],
      ),
    );
  }
}
