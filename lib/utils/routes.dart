import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:taskmanager/screens/addTask.dart';
import 'package:taskmanager/screens/allTask.dart';
import 'package:taskmanager/screens/editTask.dart';
import 'package:taskmanager/screens/homeScreen.dart';
import 'package:taskmanager/screens/taskDetail.dart';

class Routes {
  static String home = '/';
  static String allTasks = '/allTasks';
  static String addTasks = '/addTasks';
  static String editTasks = '/editTasks';
  static String viewTasks = '/viewTasks';

  static String Home() => home;
  static String AllTasks() => allTasks;
  static String AddTasks() => addTasks;
  static String EditTasks(String id) => "$editTasks?id=$id";
  static String ViewTasks(String id) => "$viewTasks?id=$id";

  static List<GetPage> routes = [
    GetPage(name: home, page: () => homeScreen()),
    GetPage(
        name: allTasks,
        page: () => AllTask(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: addTasks,
        page: () => AddTask(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: viewTasks,
        page: () {
          var id = Get.parameters["id"];
          return TaskDetail(id: id!);
        },
        transition: Transition.upToDown,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        name: editTasks,
        page: () {
          var id = Get.parameters["id"];
          return EditTask(id: id!);
        },
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)),
  ];
}
