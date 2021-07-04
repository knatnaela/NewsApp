import 'package:flutter_getx_state_managment/core/repository/news_repository_impl.dart';
import 'package:flutter_getx_state_managment/feature/NewsHeadline/controller/news_headline_controller.dart';
import 'package:get/get.dart';

class NewsHeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepositoryImpl());
    Get.put(NewsHeadlineController());
  }
}
