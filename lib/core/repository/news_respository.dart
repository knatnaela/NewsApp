import 'package:flutter_getx_state_managment/core/model/article.dart';

abstract class NewsRepository {
  Future<List<Article>?> getNewsHeadLine();

  Future<List<Article>?> getSearchedNews(String query);
}
