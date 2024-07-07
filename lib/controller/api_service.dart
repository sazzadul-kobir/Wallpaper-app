import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/apiDataModel.dart';

class ApiService{


  Future FetchingTrendingWallpaper() async{

      final response=await http.get(Uri.parse('https://api.pexels.com/v1/curated'),
      headers:{'Authorization' : "3xLEJNBxAh3XcHGRJI0WZ2iqL2GMrwMmBemXAzsXM9nj4AubuPbreoNx"}
      );


      if(response.statusCode==200){
        ApiDataModel data=ApiDataModel.fromJson(jsonDecode(response.body));
        return data;

      }else{
        throw Exception("Fetching error");
      }


  }

  Future GetSearchWallpaper(String query) async{
    final response=await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=30&page=1'),
        headers:{'Authorization' : "3xLEJNBxAh3XcHGRJI0WZ2iqL2GMrwMmBemXAzsXM9nj4AubuPbreoNx"}
    );


    if(response.statusCode==200){
      ApiDataModel data=ApiDataModel.fromJson(jsonDecode(response.body));

      return data;

    }else{
      throw Exception("Fetching Error");
    }
  }

}