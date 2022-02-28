import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/component/button.dart';
import 'package:taskmanager/component/errorMessage.dart';
import 'package:taskmanager/component/inputField.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/screens/allTask.dart';
import 'package:taskmanager/utils/appColors.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool validation() {
      if (nameController.text.trim() == '') {
        Message.taskError("Task Title", "Please add your task title");
        return false;
      } else if (detailController.text.trim() == '') {
        Message.taskError(
            "Task detail", "Please add your task details");
        return false;
      } else if (nameController.text.length < 10) {
        Message.taskError(
            "Task Title", "Task title should have 10 or more characters");
        return false;
      } else if (detailController.text.length < 10) {
        Message.taskError(
            "Task details", "Task details should have 10 or more characters");
        return false;
      }
      return true;
    }

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/addtask1.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //for holding the top button
            Column(children: [
              SizedBox(height: 40),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.secondaryColor,
                  ))
            ]),
            // for holding input field
            Column(
              children: [
                InputField(
                  textController: nameController,
                  hintText: "Task Title",
                  borderRadius: 30),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  textController: detailController,
                  hintText: "Task Details",
                  borderRadius: 15,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (validation()) {
                      Get.find<DataController>().createTask(nameController.text.trim(),detailController.text.trim());
                      Get.to(() => AllTask(),transition: Transition.circularReveal);
                    }
                  },
                  child: Button(
                      background: AppColors.mainColor,
                      text: "Add task",
                      textColor: Colors.white),
                )
              ],
            ),
            SizedBox( // push the text field above
              height: MediaQuery.of(context).size.height / 20,
            )
          ],
        ),
      ),
    );
  }
}
