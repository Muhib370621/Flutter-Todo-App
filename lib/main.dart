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
    _refreshController.refreshCompleted();
    sampleCont.getData();
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
        appBar: AppBar(title: Text("Todo App"),),
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
