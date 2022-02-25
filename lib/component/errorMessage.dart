import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/utils/appColors.dart';

class Message {
  static void taskError(String taskname, String taskError) {
    Get.snackbar(
      taskname,
      taskError,
      backgroundColor: AppColors.mainColor.withOpacity(0.8),
      icon: Icon(Icons.warning, color: Colors.red, size: 40),
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
      shouldIconPulse: true,
      titleText: Text(
        taskname,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
      ),
      messageText: Text(
        taskError,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.yellowAccent),
      ),
    );
  }
}