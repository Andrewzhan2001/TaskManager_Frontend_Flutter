
import 'package:get/get.dart';
import 'package:taskmanager/service/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;

  Future<void> getAllTasks() async {
    Response response = await service.getAllTasks();
    if (response.statusCode == 200) {
      _myData = response.body;
      print("Get data from server");
      update();
    } else {
      print("Did not get data from server");
    }
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.createTask({"taskName": task, "taskDetail": taskDetail});
    if (response.statusCode == 200) {
      _myData = response.body;
      update();
      print("Task add successful");
    } else {
      print("Task add failed");
    }
  }
}
