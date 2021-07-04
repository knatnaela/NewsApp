import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_state_managment/core/model/article.dart';
import 'package:flutter_getx_state_managment/core/repository/news_repository_impl.dart';
import 'package:flutter_getx_state_managment/core/repository/news_respository.dart';
import 'package:get/get.dart';

class SearchNewsController extends GetxController {
  late NewsRepository _newsRepository;
  SearchNewsController() {
    _newsRepository = Get.find<NewsRepositoryImpl>();
    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  RxList<Article> articles = RxList();

  searchNewsHeadline() async {
    showLoading();
    final result =
        await _newsRepository.getSearchedNews(searchTextController.text);
    if (result != null) {
      articles = result.obs;
    } else {
      print('No data');
    }
    hideLoading();
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
