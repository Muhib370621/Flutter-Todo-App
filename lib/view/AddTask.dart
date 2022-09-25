import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sampleController.dart';
import '../service/sampleService.dart';

class addTask extends StatelessWidget {
  var emptyString = "";
  final SampleController sampleCont = Get.put(SampleController());

  addTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Task ",
          style: TextStyle(fontSize: 24),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            sampleCont.idController.text = "";
            sampleCont.titleController.text = "";
            sampleCont.descriptionController.text = "";
            sampleCont.categoryController.text = "";
            sampleCont.timestampController.text = "";
            sampleCont.priorityController.text = "";
            sampleCont.userIDController.text = "";
            sampleCont.isCompletedController.text = "";
            Get.back();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListView.builder(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // TextFormField(
                  //   controller: sampleCont.idController,
                  //   decoration: InputDecoration(hintText: "Enter ID..."),
                  // ),
                  TextFormField(
                    controller: sampleCont.titleController,
                    decoration: InputDecoration(hintText: "Enter title..."),
                  ),
                  TextFormField(
                    controller: sampleCont.descriptionController,
                    decoration:
                        InputDecoration(hintText: "Enter Description..."),
                  ),
                  TextFormField(
                    controller: sampleCont.categoryController,
                    decoration: InputDecoration(hintText: "Enter Category"),
                  ),
                  TextFormField(
                    controller: sampleCont.timestampController,
                    decoration: InputDecoration(hintText: "Enter timestamp..."),
                  ),
                  TextFormField(
                    controller: sampleCont.priorityController,
                    decoration: InputDecoration(hintText: "Enter priority..."),
                  ),
                  TextFormField(
                    controller: sampleCont.userIDController,
                    decoration: InputDecoration(hintText: "Enter User ID..."),
                  ),
                  TextFormField(
                    controller: sampleCont.isCompletedController,
                    decoration:
                        InputDecoration(hintText: "Enter True or False..."),
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
                sampleCont.onAdding(
                    emptyString,
                    emptyString,
                    emptyString,
                    emptyString,
                    emptyString,
                    emptyString,
                    emptyString,
                    emptyString);
                if (sampleCont.Data.value[sampleCont.selected_index.value].id ==
                    sampleCont.idController.text.toString()) {
                  Get.snackbar("Data Conflict ! !", "Entered ID already exist.");
                }
                // print("${sampleCont.idController.text.toString()}");
                else {
                  SampleServices().postApi(
                      // emptyString,
                      // emptyString,
                      // emptyString,
                      // emptyString,
                      // emptyString,
                      // emptyString,
                      // emptyString,
                      // emptyString,
                  );
                  Get.snackbar("Task Added !",
                      "Task with title ${sampleCont.titleController.text.toString()} Added !");
                }
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
