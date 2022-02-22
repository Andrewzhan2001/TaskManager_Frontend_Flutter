import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskmanager/component/button.dart';
import 'package:taskmanager/component/task.dart';
import 'package:taskmanager/utils/appColors.dart';

class AllTask extends StatefulWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  State<AllTask> createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  @override
  Widget build(BuildContext context) {
    List myData = ["Try harder", "Try smarter"];
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 20, top: 60),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
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
                Icon(Icons.home, color: AppColors.secondaryColor),
                SizedBox( width: 20 ),
                // make a circle outside of icon
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: Colors.black54
                  ),
                  child: Icon( Icons.add, color: Colors.white, size: 20 ),
                ),
                Expanded(child: Container()),
                Icon(Icons.calendar_month, color: AppColors.secondaryColor),
                SizedBox( width: 20 ),
                Text( "2", style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),)
              ]
            ),
          ),
          Flexible(
              child: ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: leftIcon,
                      secondaryBackground: rightIcon,
                      onDismissed: (DismissDirection direction) {
                        print("after dismiss");
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.startToEnd) { // for left to right
                          showModalBottomSheet(
                              barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF2e3253).withOpacity(0.4),
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Button(
                                            background: AppColors.mainColor,
                                            text: "View the details",
                                            textColor: Colors.white,
                                          ),
                                          SizedBox(height: 20),
                                          Button(
                                            background: AppColors.mainColor,
                                            text: "Edit the task",
                                            textColor: Colors.white,
                                          )
                                        ],
                                      ),
                                    ));
                              });
                          return false;
                        } else {
                          return Future.delayed(const Duration(seconds: 1), () => direction == DismissDirection.endToStart);
                        }
                      },
                      key: ObjectKey(index),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        child: Task(
                          text: myData[index], //controller.myData[index]["get_task"],
                          color: Colors.blueGrey,
                        ),
                      ),
                    );
                  }))
      ]),
    );
  }
}
