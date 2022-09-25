import 'package:crud_operations/view/AddTask.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controller/sampleController.dart';
import 'service/sampleService.dart';
import 'view/MainPageView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final SampleController sampleCont = Get.put(SampleController());
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // your api here
    sampleCont.getData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // your api here
    _refreshController.loadComplete();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Todo App",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              child: Container(
                child: Icon(Icons.add),
                margin: EdgeInsets.only(right: 15),
              ),
              onTap: () {
                // Get.to(addTask());
                Get.to(addTask());
              },
            )
          ],
        ),
        body: SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: MainPageView(),
        ),
      ),
    );
  }
}
