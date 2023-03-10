
import 'dart:convert';

import 'package:get/get.dart';
import 'package:taskmanager/component/errorMessage.dart';
import 'package:taskmanager/service/service.dart';
import 'package:taskmanager/utils/constants.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Map<String, dynamic> _singleTask = {};
  Map<String, dynamic> get singleTask => _singleTask;

  Future<void> getAllTasks() async {
    _isLoading = true;
    Response response = await service.getData(appConstants.getAllTasks);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("Get data from server");
      update();
    } else {
      print("Did not get data from server");
    }
    _isLoading = false;
  }

  Future<void> getTask(String id) async {
    _isLoading = true;
    Response response = await service.getData("${appConstants.getTask}"+id);
    if (response.statusCode == 200) {
      _singleTask = jsonDecode(response.body);
      update();
    } else {
      print("Something wrong happen to this task");
    }
    _isLoading = false;
  }

  Future<void> updateTask(String task, String taskDetail, String id) async {
    _isLoading = true;
    Response response = await service.putData("${appConstants.updateTask}"+id, {"taskName": task, "taskDetail": taskDetail});
    if (response.statusCode == 200) {
      _myData = jsonDecode(response.body);
      update();
      print("Task update successfully");
    } else {
      print("Task update failed");
    }
    _isLoading = false;
  }

  Future<void> createTask(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(appConstants.createTask, {"taskName": task, "taskDetail": taskDetail});
    if (response.statusCode == 200) {
      _myData = response.body;
      update();
      print("Task add successful");
    } else {
      print("Task add failed");
    }
    _isLoading = false;
  }
  Future<void> deleteTask(String id) async {
    _isLoading = true;
    update();
    Response response =
    await service.deleteData("${appConstants.deleteTask}"+id);
    if (response.statusCode == 200) {
      update();
      Message.taskError("Successful", "Data Deleted Successfully");
    } else {
      Message.taskError("Unsuccessful", "Error in deleting data");
    }
    Future.delayed(Duration(seconds: 1), () {
      _isLoading = false;
      update();
    });
  }
}
