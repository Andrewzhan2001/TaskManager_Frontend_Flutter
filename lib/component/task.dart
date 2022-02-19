import 'package:flutter/cupertino.dart';

class Task extends StatefulWidget {
  final String text;
  final Color color;
  const Task({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 14,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Color(0xFFedf0f8), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 20,
            color: widget.color,
          ),
        )),
    );
  }
}
