import 'package:flutter_getx_state_managment/feature/SearchNews/controller/search_news_controller.dart';
import 'package:get/get.dart';

class SearchNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchNewsController());
  }
}
