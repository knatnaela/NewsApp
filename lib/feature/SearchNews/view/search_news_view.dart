import 'package:flutter/material.dart';
import 'package:flutter_getx_state_managment/core/widget/drawer.dart';
import 'package:flutter_getx_state_managment/feature/SearchNews/controller/search_news_controller.dart';
import 'package:get/get.dart';

class SearchNewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchNewsController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Search News'),
      ),
      drawer: getAppDrawer(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.searchTextController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  return controller.isLoading.isTrue
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.articles.isEmpty
                          ? Center(
                              child: Text('No News Found!'),
                            )
                          : Container(
                              margin: const EdgeInsets.all(10),
                              child: ListView.separated(
                                  itemBuilder: (context, index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          controller.articles[index]
                                                      .urlToImage ==
                                                  null
                                              ? Container()
                                              : Image.network(controller
                                                  .articles[index].urlToImage!),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                              controller.articles[index].title!,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          controller.articles[index]
                                                      .description ==
                                                  null
                                              ? Container()
                                              : Text(controller.articles[index]
                                                  .description!),
                                        ],
                                      ),
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                  itemCount: controller.articles.length));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
