import 'package:flutter_getx_state_managment/core/model/article.dart';
import 'package:flutter_getx_state_managment/core/model/news_response_model.dart';
import 'package:flutter_getx_state_managment/core/repository/news_respository.dart';

import 'package:flutter_getx_state_managment/service/http_service.dart';
import 'package:flutter_getx_state_managment/service/http_service_impl.dart';
import 'package:get/get.dart';

class NewsRepositoryImpl implements NewsRepository {
  HttpService? _httpService;

  NewsRepositoryImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService!.init();
  }

  @override
  Future<List<Article>?> getNewsHeadLine() async {
    try {
      final response =
          await _httpService!.getRequest('/v2/top-headlines?country=us');
      final parsedResponse = NewsResponse.fromJson(response.data);
      print(parsedResponse.articles![1].urlToImage);
      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Article>?> getSearchedNews(String query) async {
    try {
      final response =
          await _httpService!.getRequest('/v2/everything?q=$query');
      final parsedResponse = NewsResponse.fromJson(response.data);

      return parsedResponse.articles;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
