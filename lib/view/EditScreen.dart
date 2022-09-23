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
            onTap: () => Get.back(),
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
                      controller: sampleCont.idController.value,
                      decoration: InputDecoration(
                          hintText:
                              "${sampleCont.Data.value[sampleCont.selected_index.value].id}"),
                    ),
                    TextFormField(
                      controller: sampleCont.titleController.value,
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
                  print("____________________________________________________________");
                  print(sampleCont.updatedData.value);
                  SampleServices().putApi(
                      "23",
                      "muhib refresh",);
                },
                child: Text("Save"))
          ],
        ));
  }
}
