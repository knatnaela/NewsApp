import 'package:flutter_getx_state_managment/core/model/article.dart';
import 'package:flutter_getx_state_managment/core/repository/news_repository_impl.dart';
import 'package:flutter_getx_state_managment/core/repository/news_respository.dart';
import 'package:get/get.dart';

class NewsHeadlineController extends GetxController {
  late NewsRepository _newsRepository;
  NewsHeadlineController() {
    _newsRepository = Get.find<NewsRepositoryImpl>();
    loadNewsHeadline();
  }

  RxBool isLoading = false.obs;

  RxList<Article>? articles;

  loadNewsHeadline() async {
    showLoading();
    final result = await _newsRepository.getNewsHeadLine();
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
