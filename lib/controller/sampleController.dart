import 'package:crud_operations/model/sampleModel.dart';
import 'package:crud_operations/service/sampleService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SampleController extends GetxController {
  var isLoading = false.obs;
  var Data = <Sample>[].obs;
  var updatedData = <Sample>[].obs;
  var selected_index = 0.obs;
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController timestampController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController userIDController = TextEditingController();
  TextEditingController isCompletedController = TextEditingController();

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    getData();
    // TODO: implement onInit
    super.onInit();
    // idController.addListener(printID());
    }

  void onClose() {
    super.onClose();
  }

  void onSavePressed(String id,String text) {
    id = idController.text;
    text = titleController.text;
  }

  void onAdding(String id, String title, String description, String category,
      String timestamp, String priority, String userID, String isCompleted) {
    id = idController.text;
    title = idController.text;
    description = descriptionController.text;
    category = categoryController.text;
    timestamp = timestampController.text;
    priority = priorityController.text;
    userID = userIDController.text;
    isCompleted = isCompletedController.text;

  }

  Future<List<Sample>?> getData() async {
    var result = await SampleServices().getApi();
    Data.value = result;
    isLoading.value = false;
    return result;
  }



  // Future<List<Sample>?> putData() async {
  //   var newResult = await SampleServices().putApi(
  //     idController.value.toString(),
  //     titleController.value.toString(),
  //   );
  //
  //   updatedData.value = newResult;
  //   // Data.value=updatedData.value;
  //   isLoading.value = false;
  //   return newResult;
  // }
  // void _onLoading() async {
  //   // your api here
  //   _refreshController.loadComplete();
  // }

// Future<List<Sample>?> deleteData(id)  async {
//   var after_delete = await SampleServices().deleteApi(id);
//   Data.value = after_delete!;
//   print("Successfully Deleted !");
// }
}
