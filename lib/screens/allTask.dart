import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  fit: BoxFit.scaleDown, image: AssetImage("assets/header1.jpg")),
            ),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.secondaryColor,
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
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Task(
                        text: myData[index],
                        //controller.myData[index]["get_task"],
                        color: Colors.blueGrey,
                      ),
                    );
                  }))
      ]),
    );
  }
}
