import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/component/inputField.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/screens/allTask.dart';
import 'package:taskmanager/utils/appColors.dart';

class TaskDetail extends StatefulWidget {
  final String id;
  const TaskDetail({Key? key, required this.id}) : super(key: key);
  loadTask() async {
    await Get.find<DataController>().getTask(id);
  }
  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    widget.loadTask();
    TextEditingController detailController = TextEditingController();
    return Scaffold(body: GetBuilder<DataController>(builder: (controller) {
      return Column(children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 20),
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              Get.off(()=> AllTask(), transition: Transition.fade);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.mainColor,
              ),
            ),
          ),
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/header1.jpg"), fit: BoxFit.fitWidth)),
        ),
        SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom:
                  BorderSide(color: AppColors.secondaryColor, width: 1.6))),
          child: Text(
            "${controller.singleTask["taskName"]}",
            style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.only(left: 20, top: 20),
          height: MediaQuery.of(context).size.height / 3,
          width: double.maxFinite,
          decoration: BoxDecoration(color: AppColors.textHolder),
          child: Text(
            "${controller.singleTask["taskDetail"]}",
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18,
            ),
          ),
        ),
      ]);
    }));
  }
}
