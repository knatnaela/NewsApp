import 'package:flutter/material.dart';
import 'package:flutter_getx_state_managment/feature/NewsHeadline/binding/news_headline_binding.dart';
import 'package:flutter_getx_state_managment/feature/NewsHeadline/view/news_headline_view.dart';
import 'package:flutter_getx_state_managment/feature/SearchNews/binding/search_news_binding.dart';
import 'package:flutter_getx_state_managment/feature/SearchNews/view/search_news_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      getPages: [
        GetPage(
            name: '/news-headline',
            page: () => NewsHeadlineView(),
            binding: NewsHeadlineBinding()),
        GetPage(
            name: '/search-news',
            page: () => SearchNewsView(),
            binding: SearchNewsBinding()),
      ],
      initialRoute: "/news-headline",
    );
  }
}
