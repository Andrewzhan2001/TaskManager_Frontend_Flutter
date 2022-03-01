import 'package:flutter/material.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/screens/addTask.dart';
import 'package:taskmanager/screens/allTask.dart';
import 'package:taskmanager/screens/homeScreen.dart';
import 'package:get/get.dart';
import 'package:taskmanager/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  loadTasks() async {
    await Get.find<DataController>().getAllTasks();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadTasks();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const homeScreen(),  initial route
      initialRoute: Routes.Home(),
      getPages: Routes.routes,
    );
  }
}

