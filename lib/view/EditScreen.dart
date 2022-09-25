import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sampleController.dart';
import '../service/sampleService.dart';

class EditScreen extends StatelessWidget {
  final SampleController sampleCont = Get.put(SampleController());

  EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Get.back();
            sampleCont.idController.text = "";
            sampleCont.titleController.text = "";
          },
        ),
        title: Text(
          "Edit Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.builder(
            padding: EdgeInsets.only(left: 15, right: 15, top: 30),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  TextFormField(
                    controller: sampleCont.idController,
                    decoration: InputDecoration(
                        hintText:
                            "${sampleCont.Data.value[sampleCont.selected_index.value].id}"),
                  ),
                  TextFormField(
                    controller: sampleCont.titleController,
                    decoration: InputDecoration(
                        hintText:
                            "${sampleCont.Data.value[sampleCont.selected_index.value].title}"),
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                sampleCont.onSavePressed(
                  "${sampleCont.Data.value[sampleCont.selected_index.value].id}",
                  "${sampleCont.Data.value[sampleCont.selected_index.value].title}",
                );
                if (sampleCont.Data.value[sampleCont.selected_index.value].id !=
                    sampleCont.idController.text.toString()) {
                  Get.snackbar("Data Not Found !", "Entered ID doesn't exist.");
                }
                // print("${sampleCont.idController.text.toString()}");
                else {
                  SampleServices().putApi(
                    "${sampleCont.idController.text.toString()}",
                    "${sampleCont.titleController.text.toString()}",
                  );
                  Get.snackbar("Task Editted !",
                      "Task with ID ${sampleCont.idController.text.toString()} editted !");
                }
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
