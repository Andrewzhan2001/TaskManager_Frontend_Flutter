import 'package:flutter/material.dart';
import 'package:taskmanager/component/button.dart';
import 'package:taskmanager/screens/addTask.dart';
import 'package:taskmanager/screens/allTask.dart';
import 'package:taskmanager/utils/appColors.dart';
import 'package:get/get.dart';
import 'package:taskmanager/utils/routes.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/welcome.jpg"
            )
          )
        ),
        child: Column ( // create a vertical array of children
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText( // so that we can make new line easily and style them differently
              text: TextSpan(
                text: "Hello",
                style: TextStyle( // create a textstyle
                    color: AppColors.mainColor,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: "\nStart your beautiful day",
                      style: TextStyle(
                          color: AppColors.smallTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w900))
                ]),
            ),
            SizedBox( height: MediaQuery.of(context).size.height / 2.5,),
            InkWell(
              onTap: () {
                // Get.to(() => AddTask(),transition: Transition.zoom,duration: Duration(milliseconds: 500));
                Get.toNamed(Routes.AddTasks());
              },
              child: Button(background: AppColors.mainColor, text: "Add Task", textColor: Colors.white),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Get.to(() => AllTask(), transition: Transition.fade, duration: Duration(seconds: 1));
                Get.toNamed(Routes.AllTasks());
              },
              child: Button( background: Colors.white, text: "View all tasks ", textColor: AppColors.smallTextColor),
            )
          ],
        ),
      ),
    );
  }
}
