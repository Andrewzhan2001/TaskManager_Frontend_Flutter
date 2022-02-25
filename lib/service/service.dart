import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getAllTasks() async {
    Response response = await get("http://192.170.120.61:8082/gettasks",
        headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<Response> createTask(dynamic body) async {
    Response response = await post("http://192.170.120.61:8082/create", body,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    return response;
  }
}
