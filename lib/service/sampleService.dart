import 'dart:convert';
import 'dart:developer';
import 'package:crud_operations/model/components/sampleComponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../controller/sampleController.dart';
import '../model/sampleModel.dart';

class SampleServices {
  final SampleController sampleCont = Get.put(SampleController());
  Future<List<Sample>> getApi() async {
    var url = UrlSchemes.baseUrl + UrlSchemes.todosUrl;
    var response = await http.get(Uri.parse(url));

    print(response.statusCode);
    if (response.statusCode == 200) {
      return sampleFromJson(response.body);
    }
    if (response.statusCode == 500) {
      throw Exception("Service not responding");
    } else {
      throw Exception("Something went wrong");
    }
  }

  Future<List<Sample>?> postApi() async {
    var url = Uri.parse(UrlSchemes.baseUrl + UrlSchemes.todosUrl);
    var response = await http.post(url, body: {
      "title": sampleCont.titleController.text.toString(),
      "description": sampleCont.descriptionController.text.toString(),
      "category": sampleCont.categoryController.text.toString(),
      "timestamp": sampleCont.timestampController.text.toString(),
      "priority": sampleCont.priorityController.text.toString(),
      "user_id": sampleCont.userIDController.text.toString(),
      "isCompleted": sampleCont.isCompletedController.text.toString(),
      "id": sampleCont.idController.text.toString(),
    });
  }
  // Future<List<Sample>?> deleteApi(id) async {
  //   var url = Uri.parse(UrlSchemes.baseUrl + UrlSchemes.todosUrl);
  //   var response = await http.delete(url);
  //   try {
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print("Successfully Deleted !");
  //     }
  //     else {
  //       throw Exception("Unsuccessfull Delete !");
  //     }
  //   } on Exception catch (e) {
  //   }
  // }
  Future<List<Sample>?> onDelete(String id) async {
    var url = Uri.parse(UrlSchemes.baseUrl + UrlSchemes.todosUrl+"/$id");
    final http.Response response = await http.delete(
      url,
    );
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        return sampleFromJson(response.body);
      } if (response.statusCode==400) {
        throw Exception("Bad request");
      }
      else {
        print(response.statusCode);
        throw Exception('Failed to delete album.');
      }
    } on Exception catch(e) {
      log(e.toString());
    }
  }

  Future<List<Sample>?> putApi(String id, String title) async {
    // var url = Uri.parse(UrlSchemes.updateUrl+"$id");
    var response = await http.put(Uri.parse("https://6087dddba6f4a30017425143.mockapi.io/api/todos/$id"), body: {
      "title": title.toString(),
    }
    );
    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        return sampleFromJson(response.body);
      } if (response.statusCode==400) {
        throw Exception("Bad request");
      }
      else {
        print(response.statusCode);
        throw Exception('Failed to Edit Item.');
      }
    } on Exception catch(e) {
      log(e.toString());
    }
  }



}
