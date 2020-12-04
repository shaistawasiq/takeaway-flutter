import 'package:flutter/material.dart';
// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  const RoundButton(
      {@required this.text,
        @required this.color,
        @required this.textColor,
        @required this.function,
        this.width});
  final String text;
  final Color textColor;
  final Color color;
  final Function function;
  final int width;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width == null ? (size.width * 0.8) : (size.width * 1),
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FlatButton(
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(color: textColor,fontSize: 20.0,fontWeight: FontWeight.bold),
          ),
          color: color,
        ),
      ),
    );
  }
}