import 'package:flutter/cupertino.dart';

class Button extends StatefulWidget {
  final Color background;
  final String text;
  final Color textColor;
  const Button(
      {Key? key,
        required this.background,
        required this.text,
        required this.textColor})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14, // dynamic height
      decoration: BoxDecoration(
          color: widget.background, borderRadius: BorderRadius.circular(40)),
      child: Center(
          child: Text(widget.text, style: TextStyle(fontSize: 20, color: widget.textColor))),
    );
  }
}
