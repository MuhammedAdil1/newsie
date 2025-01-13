import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import 'package:newsie/models/categories_news_model.dart';
import 'package:newsie/models/news_headlines_model.dart';


class NewsRepository{

  Future<NewsHeadlinesModel> fetchNewsHeadlinesApi () async {

    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=47daa48580714c6e9f90f0e923353ad0';

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
     return NewsHeadlinesModel.fromJson(body);
    }
    throw Exception('Error');
  }



  Future<CategoriesNewsModel> fetchCategoriesNewsApi (String category) async {

    String url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=47daa48580714c6e9f90f0e923353ad0';

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
     return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }



}