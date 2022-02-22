import 'package:flutter/material.dart';
import 'package:taskmanager/screens/addTask.dart';
import 'package:taskmanager/screens/allTask.dart';
import 'package:taskmanager/screens/homeScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const homeScreen(), // initial route
    );
  }
}

