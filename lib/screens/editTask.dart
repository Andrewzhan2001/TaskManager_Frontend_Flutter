import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskmanager/component/button.dart';
import 'package:taskmanager/component/errorMessage.dart';
import 'package:taskmanager/component/inputField.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/screens/allTask.dart';
import 'package:taskmanager/utils/appColors.dart';

class EditTask extends StatefulWidget {
  final String id;
  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  EditTask({Key? key,  required this.id}) : super(key: key);
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  loadTask() async {
    await Get.find<DataController>().getTask(widget.id);
    DataController controller = Get.find<DataController>();
    widget.nameController.text = controller.singleTask["taskName"];
    widget.detailController.text = controller.singleTask["taskDetail"];
  }
  bool _dataValidation() {
    if (widget.nameController.text.trim().isEmpty) {
      Message.taskError("Task title", "Task title is empty");
      return false;
    } else if (widget.detailController.text.trim().isEmpty) {
      Message.taskError("Task detail", "Task detail is empty");
      return false;
    } else if (widget.nameController.text.trim().length < 10) {
      Message.taskError(
          "Task Name", "Task title should be at least 10 character");
      return false;
    } else if (widget.detailController.text.trim().length < 10) {
      Message.taskError(
          "Task detail", "Task detail should be at least 10 character");
      return false;
    }
    return true;
  }
  @override
  initState() {
    print("initState Called");
    loadTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<DataController>(builder: (controller) {
      return Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/addtask2.jpg"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 40),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.mainColor,
                    ))
              ],
            ),
            Column(
              children: [
                InputField(
                    textController: widget.nameController,
                    hintText: "Task Title",
                    borderRadius: 30),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  textController: widget.detailController,
                  hintText: "Task Details",
                  borderRadius: 15,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (_dataValidation()) {
                      Get.find<DataController>().updateTask(widget.nameController.text.trim(),widget.detailController.text.trim(),controller.singleTask["id"].toString());
                      Get.back();
                      Get.off(() => AllTask(), transition: Transition.zoom);
                    }
                  },
                  child: Button(
                      background: AppColors.mainColor,
                      text: "Update",
                      textColor: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            )
          ],
        ),
      );
    }));
  }
}
