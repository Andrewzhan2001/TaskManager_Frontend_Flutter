import 'package:get/get.dart';
import 'package:taskmanager/utils/constants.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String URI) async {
    Response response = await get(appConstants.baseUrl+URI,
        headers: {'Content-Type': 'application/json'});
    return response;
  }

  Future<Response> postData(String URI, dynamic body) async {
    Response response = await post(appConstants.baseUrl+URI, body,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    return response;
  }
}
