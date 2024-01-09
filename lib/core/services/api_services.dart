import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_15/model1/model1.dart';

// import 'package:http/http.dart' as http;

class Api_serve {
  static Future<List<Model1>?> getNewsBysearch(String searchKye) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?apiKey=1b5ded8149ec412c9bc0dda238872686&country&q=$searchKye');
      if (res.statusCode == 200) {
        var data = res.data as List;
        List<Model1> posts = data.map((e) => Model1.fromJson(e)).toList();
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<Model1?> getNewsByCategory(String category) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?apiKey=1b5ded8149ec412c9bc0dda238872686&country=us&category=$category');
      if (res.statusCode == 200) {
        var news = Model1.fromJson(res.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}


