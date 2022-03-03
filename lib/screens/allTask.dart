import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskmanager/component/button.dart';
import 'package:taskmanager/component/task.dart';
import 'package:taskmanager/controller/controller.dart';
import 'package:taskmanager/screens/addTask.dart';
import 'package:taskmanager/screens/editTask.dart';
import 'package:taskmanager/screens/homeScreen.dart';
import 'package:taskmanager/screens/taskDetail.dart';
import 'package:taskmanager/utils/appColors.dart';
import 'package:taskmanager/utils/routes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllTask extends StatefulWidget {
  const AllTask({Key? key}) : super(key: key);
  loadData() async {
    await Get.find<DataController>().getAllTasks();
  }
  @override
  State<AllTask> createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  @override
  Widget build(BuildContext context) {
    widget.loadData();
    final leftIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(body: GetBuilder<DataController>(builder: (controller){
      return controller.isLoading == false ? Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 20, top: 60),
              width: double.maxFinite,
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/header1.jpg")),
              ),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.home);
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        child: Icon(
                          Icons.home,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(Routes.addTasks);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(12.5)),
                        width: 20,
                        height: 20,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(Icons.calendar_month, color: AppColors.secondaryColor),
                    SizedBox(width: 20),
                    Text("${controller.myData.length}", style: TextStyle(
                        fontSize: 20, color: AppColors.secondaryColor),)
                  ]
              ),
            ),
            Flexible(
                child: ListView.builder(
                    itemCount: controller.myData.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: leftIcon,
                        secondaryBackground: rightIcon,
                        onDismissed: (DismissDirection direction) {
                          print("after dismiss");
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          if (direction == DismissDirection
                              .startToEnd) { // for left to right
                            showModalBottomSheet(
                                barrierColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (_) {
                                  return Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF2e3253)
                                              .withOpacity(0.4),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                                Get.toNamed(Routes.ViewTasks(
                                                    controller.myData[index]["id"]
                                                        .toString()));
                                              },
                                              child: Button(
                                                  background:
                                                  AppColors.mainColor,
                                                  text: "View",
                                                  textColor: Colors.white),
                                            ),
                                            SizedBox(height: 10),
                                            InkWell(
                                              onTap: () {
                                                Get.back();
                                                Get.toNamed(Routes.EditTasks(
                                                    controller.myData[index]["id"]
                                                        .toString()));
                                              },
                                              child: Button(
                                                  background:
                                                  AppColors.mainColor,
                                                  text: "Edit",
                                                  textColor: Colors.white),
                                            )
                                          ],
                                        ),
                                      ));
                                });
                            return false;
                          } else {
                            Get.find<DataController>().deleteTask(controller.myData[index]["id"].toString());
                            return Future.delayed( Duration(milliseconds: 500), () async {
                              await controller.getAllTasks();
                              return direction ==DismissDirection.endToStart;
                            });
                          }
                        },
                        key: ObjectKey(index),
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: Task(
                            text: controller.myData[index]["taskName"],
                            color: Colors.blueGrey,
                          ),
                        ),
                      );
                    }))
          ]) : SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SpinKitThreeInOut(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: index.isEven
                        ? Colors.redAccent
                        : Colors.greenAccent));
          },
        ),
      );
    }
    ));
  }
}
