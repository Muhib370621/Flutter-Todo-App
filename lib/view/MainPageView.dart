import 'package:crud_operations/view/EditScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controller/sampleController.dart';
import '../model/sampleModel.dart';
import '../service/sampleService.dart';

class MainPageView extends StatelessWidget {
  final SampleController sampleCont = Get.put(SampleController());

  MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: sampleCont.Data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        "Todo",
                        "Press one more time to edit",
                        duration: Duration(milliseconds: 1000),
                      );
                    },
                    onDoubleTap: () {
                      sampleCont.selected_index.value = index;
                      Get.to(EditScreen());
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.all(4),
                      leading: Text(
                        "${sampleCont.Data.value[index].id}",
                      ),
                      title: Text(
                        "${sampleCont.Data.value[index].title}",
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Icon(Icons.delete,color: Colors.red[300],size: 30,),
                            onTap: () {
                              SampleServices().onDelete(
                                  sampleCont.Data.value[index].id.toString());
                            },
                          ),
                          // SizedBox(height: 8,),
                          // GestureDetector(
                          //   child: Icon(Icons.edit),
                          //   onTap: () {
                          //    Get.to(EditScreen());
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                SampleServices().postApi();
              },
              child: Text("POST")),
        ],
      ),
    );
  }
}
