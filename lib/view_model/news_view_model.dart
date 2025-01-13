


import 'package:newsie/models/categories_news_model.dart';
import 'package:newsie/models/news_headlines_model.dart';
import 'package:newsie/repository/news_repository.dart';

class NewsViewModel {

  final _rep = NewsRepository();
  // Instance of NewsRepository and naming it  _rep for shorthand reference.


  Future<NewsHeadlinesModel> fetchNewsHeadlinesApi() async {
    // Declares a method/function -> fetchNewsHeadlinesApi that,
    // Returns a 'Future' <> of type -> NewsHeadlinesModel. Uses 'async' to handle asynchronous operations
    final response = await _rep.fetchNewsHeadlinesApi();
    // Calls the fetchNewsHeadlinesApi  method/function  from _rep => (the NewsRepository instance),
    // Uses await to pause execution until the API call completes and returns the response.
    return response;
    // Returns the 'response' from the API
  }


  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;
  }


}
